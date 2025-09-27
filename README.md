
## Cyber Scanner App

## 🙏 Acknowledgements

### بالعربية
أود أن أعبر عن امتناني لكل من ساعدني في تطوير هذا المشروع.  
شكر خاص إلى:  

- [GitHub](https://github.com) لإتاحة منصة رائعة لمشاركة المشاريع.  
- [readme.so](https://readme.so/) لتسهيل إنشاء وتنسيق ملفات README.  
- المكتبات والأدوات مفتوحة المصدر التي تم استخدامها في هذا المشروع.  
- كل من قدّم ملاحظات أو دعم أثناء تطوير المشروع.  

تم تطوير هذا المشروع بواسطة صهيب 💻.  

---

## Demo

Insert gif or ths is my wiup
   [Demo](https://F:/Traffic_ligiht/Traffic_ligiht/index.html) 


### In English
I would like to express my gratitude to everyone who supported me in developing this project.  
Special thanks to:  

- [GitHub](https://github.com) for providing such a great platform to share projects.  
- [readme.so](https://readme.so/) for making it easier to create and format README files.  
- The open-source libraries and tools that were used in this project.  
- Everyone who provided feedback or support during the development process.  

This project was developed by Sohip 💻.
## API Reference

# Project Title

 
 
 

مشروع *Flutter* متخصص في مجال الامن السيبراني (Cyber Scanner APP) 



---

🛡️ Cyber Scanner App (تطبيق الماسح الإلكتروني)

هو تطبيق أمني (Security App) هدفه فحص الشبكات والأنظمة بحثًا عن ثغرات أو منافذ مفتوحة أو إعدادات غير آمنة، بحيث يساعد المستخدم أو مدير النظام على اكتشاف المخاطر قبل أن يستغلها المهاجمون.


---

✨ الوظائف الأساسية للتطبيق:

1. فحص الشبكات (Network Scanning):

التعرف على الأجهزة المتصلة بالشبكة.

كشف عناوين الـ IP والمنافذ المفتوحة.



2. تحليل المنافذ (Port Scanning):

تحديد البروتوكولات المستخدمة (HTTP, FTP, SSH…).

التحقق من الخدمات النشطة.



3. فحص الثغرات (Vulnerability Scanning):

البحث عن ثغرات شائعة (مثل ضعف كلمات المرور أو إعدادات غير آمنة).



4. تقرير النتائج (Reporting):

عرض نتائج الفحص بشكل منظم (مخاطر عالية – متوسطة – منخفضة).

توفير اقتراحات للحلول.





---

🎯 الهدف من المشروع:

زيادة الوعي الأمني للمستخدمين.

مساعدة مسؤولي الشبكات في حماية الأنظمة.

توفير أداة سهلة الاستخدام لفحص الأمان بشكل دوري.



---

📱 الاستخدامات العملية:

فحص شبكة Wi-Fi المنزلية والتأكد من الأمان.

استخدامه في بيئة العمل من قِبل مسؤولي الـ IT.

أداة تدريبية للطلاب والمهتمين في مجال الأمن السيبراني.



---




## 🚀 About Me
"أنا مطور متكامل بخبرة في صياغة التجارب الرقمية المتكاملة، بدءًا من الهيكل وصولاً إلى النشر,الهدف منه بناء تطبيق تجريبي يوضح قوة ومرونة المشروع باستخدام فلاتر في إنشاء واجهات تفاعلية ومرنة. أبحث دائمًا عن التحدي التقني وتطبيق أفضل الممارسات.


## Installation

## 🛠️ التقنيات المستخدمة (Tech Stack)

| التقنية / الأداة | الغرض |
|---|---|
| Flutter (فلاتر) | إطار العمل الأساسي لبناء تطبيقات الهواتف الذكية (Android و iOS) وغيرها من المنصات بواجهة مستخدم واحدة. |
| Dart (دارت) | لغة البرمجة المستخدمة لكتابة كود فلاتر، وهي سريعة وموجهة للكائنات. |
| Provider / Bloc (لإدارة الحالة) | أدوات أساسية لإدارة بيانات التطبيق وضمان تحديث الواجهات بشكل فعال ومنظم. |
| Firebase (خدمات جوجل) | استخدام خدمات مثل قواعد البيانات في الوقت الفعلي أو المصادقة أو التخزين السحابي للتطبيق.
## Usage/Examples

import 'package:flutter/material.dart';

void main() {
  runApp(const PhishingApp());
}

class PhishingApp extends StatelessWidget {
  const PhishingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phishing Detector - Single Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SinglePageHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/* ===========================
   SinglePageHome: صفحة واحدة تحتوي
   - إدخال الرابط
   - منطقة عرض النتائج (تتغير حسب الحالة)
   =========================== */
class SinglePageHome extends StatefulWidget {
  const SinglePageHome({super.key});

  @override
  State<SinglePageHome> createState() => _SinglePageHomeState();
}

class _SinglePageHomeState extends State<SinglePageHome> {
  final TextEditingController _controller = TextEditingController();
  AnalysisResult? _lastResult;
  String? _lastUrl;

  void _runAnalysis() {
    final raw = _controller.text.trim();
    if (raw.isEmpty) {
      // حالة الحقل الفارغ
      setState(() {
        _lastResult = null;
        _lastUrl = null;
      });
      _showEmptyDialog();
      return;
    }

    final url = _normalizeUrl(raw);
    final analysis = LinkAnalyzer.analyze(url);

    setState(() {
      _lastUrl = url;
      _lastResult = analysis;
    });
  }

## Used By

* *[@loay-suhaib]* (https://github.com/sohip123-xor/sohip.git)
* *[@sara-Marish]* (https://github.com/sohip123-xor/Traffic_linght.git)

👥 المساهمون والمطورون (Contributors)

نقدر جهود كل من ساهم في بناء وتطوير هذا المشروع. الشكر الجزيل للمطورين التاليين:


*MAIN*

*الدور: تطوير وتنفيذ **واجهات فلاتر (Flutter UI)* وتنسيقها.
GitHub: [(https://github.com/sohip123-xor/sohip.git)]

*صهيب وليد*

*الدور: بناء **المنطق الخلفي (Business Logic)* للتطبيق وإدارة خدمات الـ *API*.
GitHub: https://github.com/Suhaib-Waleed (يرجى استبداله باسم المستخدم الفعلي)

*لؤي صهيب*

*الدور: إدارة **حالة التطبيق (State Management)* وضمان تكامل الشيفرة (Code Integration).
GitHub: https://github.com/Abdulmalik-Mohamed (يرجى استبداله باسم المستخدم الفعلي)

*عبد الملك *

*الدور: مراجعة الأكواد (Code Review) وضمان **جودة* الشيفرة و*كتابة التوثيق* الفني للمشروع.
GitHub: https://github.com/Abdulqadir-Mohamed (يرجى استبداله باسم المستخدم الفعلي)

#### Get all items

```http
  GET /api/items
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Get item

```http
  GET /api/items/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |

#### add(num1, num2)

Takes two numbers and returns the sum.

## 📎 Appendix

### بالعربية
- لمزيد من المعلومات حول المشروع يمكن زيارة [التوثيق الرسمي](https://example.com/docs).  
- لمعرفة المزيد عن كيفية استخدام GitHub، اطلع على [GitHub Docs](https://docs.github.com).  
- تمت تجربة المشروع على أنظمة: Windows 11, Ubuntu 22.04, Android 13.  
- ملاحظة: إذا واجهت أي مشاكل، تأكد من تثبيت جميع المكتبات المطلوبة وتشغيل الأوامر بصلاحيات المسؤول.  

---

### In English
- For more information about the project, visit the [official documentation](https://example.com/docs).  
- To learn more about using GitHub, check out the [GitHub Docs](https://docs.github.com).  
- This project has been tested on: Windows 11, Ubuntu 22.04, Android 13.  
- Note: If you face any issues, make sure all required dependencies are installed and run the commands with administrator privileges.## ✍️ Authors

### بالعربية
- صهيب وليد – مطور المشروع  
  - [GitHub](https://github.com/sohip)  
  - [LinkedIn](https://linkedin.com/in/sohip)  

---

### In English
- Sohip Waleed – Project Developer  
  - [GitHub](https://github.com/sohip)  
  - [LinkedIn](https://linkedin.com/in/sohip)## 🏅 Badges

### Examples
Here are some example badges you can use in your project:

- ![Language](https://img.shields.io/badge/language-Dart-blue)
- ![Version](https://img.shields.io/badge/version-1.0.0-brightgreen)
- ![License](https://img.shields.io/badge/license-MIT-yellow)
- ![Build](https://img.shields.io/badge/build-passing-success)
- ![GitHub stars](https://img.shields.io/github/stars/sohip/project-name?style=social)
- ![Downloads](https://img.shields.io/github/downloads/sohip/project-name/total)## 🎨 Color Reference

| Color Name | Hex Code   | Preview |
|------------|-----------|---------|
| Primary    | #1E90FF   | <span style="background-color:#1E90FF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| Secondary  | #FFD700   | <span style="background-color:#FFD700;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| Accent     | #FF4500   | <span style="background-color:#FF4500;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |
| Background | #F5F5F5   | <span style="background-color:#F5F5F5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> |


## 🔗 GitHub Profile - Links

### الحساب الشخصي
- [Sohip's GitHub](https://github.com/sohip)

### المشاريع المميزة
- [مشروع Flutter](https://github.com/sohip/flutter-project)
- [مشروع API](https://github.com/sohip/api-project)

### حسابات أخرى
- [LinkedIn](https://linkedin.com/in/sohip)
- [Portfolio](https://sohip.dev)
## Usage/Examples

```javascript
import Component from 'my-project'

function App() {
  return <Component />
}
```


## Other Common Github Profile Sections
👩‍💻 I'm currently working on...

🧠 I'm currently learning...

👯‍♀️ I'm looking to collaborate on...

🤔 I'm looking for help with...

💬 Ask me about...

📫 How to reach me...

😄 Pronouns...

⚡️ Fun fact...


## 🌐 GitHub Profile – Other

### بالعربية
- LinkedIn: [Sohip LinkedIn](https://linkedin.com/in/sohip)  
- Portfolio: [sohip.dev](https://sohip.dev)  
- Twitter: [@sohip](https://twitter.com/sohip)  
- Discord: Sohip#1234  

### In English
- LinkedIn: [Sohip LinkedIn](https://linkedin.com/in/sohip)  
- Portfolio: [sohip.dev](https://sohip.dev)  
- Twitter: [@sohip](https://twitter.com/sohip)  
- Discord: Sohip#1234

