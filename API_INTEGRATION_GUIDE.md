# 📡 API Integration Guide

## المحتويات
- 🔐 المصادقة (Authentication)
- 💬 الدردشة (Chat)
- 🌐 الترجمة (Translation)
- 📖 القاموس (Dictionary)
- 👤 حساب المستخدم (Account)

---

## ⚙️ الإعدادات الأساسية

### 1. تغيير رابط الـ Backend API

في ملف `lib/core/network/api_service.dart`:
```dart
static const String baseUrl = 'https://api.freetalk.com/api/';
```

### 2. إضافة `flutter_secure_storage`

تأكد من إضافة المكتبة في `pubspec.yaml`:
```yaml
dependencies:
  flutter_secure_storage: ^9.0.0
```

---

## 📚 كيفية الاستخدام

### استيراد الـ Repositories

```dart
import 'package:freetalk/data/repo/repository_provider.dart';

final authRepo = RepositoryProvider().authRepository;
final chatRepo = RepositoryProvider().chatRepository;
```

---

## 🔐 المصادقة (Authentication)

### تسجيل الدخول
```dart
try {
  final response = await authRepo.login('user@example.com', 'password123');
  print('مرحبا ${response.user.name}');
} catch (e) {
  print('خطأ: $e');
}
```

### التسجيل
```dart
try {
  final response = await authRepo.register(
    name: 'أحمد',
    email: 'ahmed@example.com',
    password: 'password123',
    phoneNumber: '+201001234567',
  );
  print('تم إنشاء حسابك بنجاح');
} catch (e) {
  print('خطأ: $e');
}
```

### تسجيل الخروج
```dart
await authRepo.logout();
```

### الحصول على الـ Token المحفوظ
```dart
final token = await authRepo.getToken();
```

### تحديث الـ Token
```dart
await authRepo.refreshToken();
```

---

## 💬 الدردشة (Chat)

### الحصول على سجل الدردشة
```dart
final messages = await chatRepo.getChatHistory(
  conversationId: 'conv_123',
  page: 1,
  limit: 50,
);

for (var message in messages) {
  print('${message.senderName}: ${message.content}');
}
```

### الحصول على المحادثات
```dart
final conversations = await chatRepo.getConversations();

for (var conv in conversations) {
  print('${conv.name}: ${conv.lastMessage}');
}
```

### إرسال رسالة
```dart
final message = await chatRepo.sendMessage(
  conversationId: 'conv_123',
  content: 'مرحبا! كيف حالك؟',
  imageUrl: null, // اختياري
);

print('تم إرسال الرسالة: ${message.id}');
```

### تعديل رسالة
```dart
final editedMessage = await chatRepo.editMessage(
  messageId: 'msg_456',
  newContent: 'الرسالة المعدلة',
);
```

### حذف رسالة
```dart
await chatRepo.deleteMessage('msg_456');
```

---

## 🌐 الترجمة (Translation)

### ترجمة نص
```dart
final result = await translateRepo.translateText(
  text: 'Hello world',
  sourceLanguage: 'en',
  targetLanguage: 'ar',
);

print('الترجمة: ${result.translatedText}');
```

### الحصول على اللغات المدعومة
```dart
final languages = await translateRepo.getSupportedLanguages();

for (var lang in languages) {
  print('${lang.code}: ${lang.name}');
}
```

### سجل الترجمات
```dart
final history = await translateRepo.getTranslationHistory(
  page: 1,
  limit: 20,
);

for (var translation in history) {
  print('${translation.originalText} -> ${translation.translatedText}');
}
```

---

## 📖 القاموس (Dictionary)

### البحث عن كلمة
```dart
final result = await dictionaryRepo.searchWord('hello');

print('الكلمة: ${result.word}');
print('التعاريف: ${result.definitions}');
print('المترادفات: ${result.synonyms}');
```

### الحصول على تفاصيل الكلمة
```dart
final word = await dictionaryRepo.getWordDetails('word_123');

print('الكلمة: ${word.word}');
print('المعنى: ${word.meaning}');
print('الأمثلة: ${word.examples}');
```

### الكلمات المفضلة
```dart
// الحصول على المفضلة
final favorites = await dictionaryRepo.getFavoriteWords(
  page: 1,
  limit: 50,
);

// إضافة إلى المفضلة
await dictionaryRepo.addToFavorites('word_123');

// إزالة من المفضلة
await dictionaryRepo.removeFromFavorites('word_123');
```

---

## 👤 حساب المستخدم (Account)

### الحصول على الملف الشخصي
```dart
final user = await accountRepo.getUserProfile();

print('الاسم: ${user.name}');
print('البريد: ${user.email}');
print('رقم الهاتف: ${user.phoneNumber}');
```

### تحديث الملف الشخصي
```dart
final updatedUser = await accountRepo.updateProfile(
  name: 'أحمد محمد',
  phoneNumber: '+201001234567',
  preferredLanguage: 'ar',
);

print('تم تحديث البيانات بنجاح');
```

### تغيير كلمة المرور
```dart
try {
  await accountRepo.changePassword(
    oldPassword: 'old_password123',
    newPassword: 'new_password123',
  );
  print('تم تغيير كلمة المرور بنجاح');
} catch (e) {
  print('خطأ: $e');
}
```

### حذف الحساب
```dart
try {
  await accountRepo.deleteAccount();
  print('تم حذف الحساب');
} catch (e) {
  print('خطأ: $e');
}
```

---

## 🛠️ معالجة الأخطاء

```dart
try {
  // أي عملية API
  final result = await authRepo.login('email@example.com', 'password');
} on DioException catch (e) {
  if (e.response?.statusCode == 401) {
    print('عدم المصادقة - يرجى تسجيل الدخول مجددا');
  } else if (e.response?.statusCode == 404) {
    print('المورد غير موجود');
  } else if (e.response?.statusCode == 500) {
    print('خطأ في الخادم');
  } else {
    print('خطأ: ${e.message}');
  }
} catch (e) {
  print('خطأ غير متوقع: $e');
}
```

---

## 📝 ملاحظات مهمة

1. **الـ Token يتم حفظه تلقائياً** في `FlutterSecureStorage` بعد تسجيل الدخول
2. **يتم إضافة الـ Token تلقائياً** في جميع الطلبات عبر `Interceptor`
3. **معالجة الأخطاء التلقائية** عند انتهاء صلاحية الـ Token
4. **جميع الـ Models قابلة للتسلسل** (`toJson/fromJson`)

---

## 🔄 الخطوات التالية

بعد إضافة الـ Backend:
1. ✅ تحديث رابط الـ API الفعلي
2. ✅ تعديل الـ Models حسب استجابة الخادم
3. ✅ إضافة معالجة الأخطاء إلى الـ UI
4. ✅ اختبار جميع العمليات
