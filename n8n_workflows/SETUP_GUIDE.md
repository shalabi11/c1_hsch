# دليل إعداد N8N Workflows — C1 HSCH Bot

## الملفات المُنشأة

| الملف | الوصف |
|--------|--------|
| [`c1_main_workflow.json`](c1_main_workflow.json) | الـ Workflow الرئيسي — Telegram + AI Agent |
| [`c1_subwf1_linguistic.json`](c1_subwf1_linguistic.json) | Sub-WF 1 — التحقق + الترجمة + الكلمات المفتاحية |
| [`c1_subwf2_github.json`](c1_subwf2_github.json) | Sub-WF 2 — بناء JSON + رفع GitHub + الإشعارات |

---

## خطوات الإعداد في N8N

### الخطوة 1: استيراد الـ Workflows بالترتيب

⚠️ **مهم: استيرد بهذا الترتيب:**
1. `c1_subwf2_github.json` أولاً
2. `c1_subwf1_linguistic.json` ثانياً
3. `c1_main_workflow.json` أخيراً

### الخطوة 2: إعداد الـ Credentials

#### أ. Telegram Bot
```
Name: Telegram Bot – C1 HSCH
Type: Telegram API
Bot Token: [ضع توكن البوت هنا]
```

#### ب. OpenRouter API
```
Name: OpenRouter API
Type: OpenAI API (اختر OpenAI من النوع)
API Key: [ضع مفتاح OpenRouter هنا]
Base URL: https://openrouter.ai/api/v1
```

#### ج. GitHub API
```
Name: GitHub — C1 HSCH
Type: GitHub API
Token: [Personal Access Token مع صلاحيات repo]
```

### الخطوة 3: ربط الـ Sub-Workflows

بعد الاستيراد، احصل على **Workflow ID** لكل Sub-WF من URL الـ n8n:
```
https://your-n8n.com/workflow/XXXXXX  ← هذا هو الـ ID
```

ثم عدّل:

**في `c1_subwf1_linguistic.json`:**
- ابحث عن `SUB_WF2_PLACEHOLDER_ID` في عقدة "Call JSON Builder + GitHub"
- استبدله بـ ID الخاص بـ `c1_subwf2_github`

**في `c1_main_workflow.json`:**
- ابحث عن `SUB_WF1_PLACEHOLDER_ID` في عقدة "process_and_upload_exam"
- استبدله بـ ID الخاص بـ `c1_subwf1_linguistic`

### الخطوة 4: ربط الـ Credentials

في كل Workflow، افتح كل عقدة تحتاج credentials واختر من القائمة:
- Telegram nodes → `Telegram Bot – C1 HSCH`
- OpenAI nodes (في Sub-WF 1) → `OpenRouter API`
- GitHub nodes → `GitHub — C1 HSCH`
- AI Agent (في Main WF) → `OpenRouter API`

### الخطوة 5: تفعيل الـ Workflows

فعّل بهذا الترتيب:
1. ✅ فعّل `c1_subwf2_github` أولاً
2. ✅ فعّل `c1_subwf1_linguistic` ثانياً
3. ✅ فعّل `c1_main_workflow` أخيراً

---

## بنية Data Flow المؤكدة

```
📱 Telegram → Parse → AI Agent (يجمع البيانات + مراجعة)
                              ↓ بعد التأكيد
                    [Tool: process_and_upload_exam]
                              ↓
              [Sub-WF 1: Linguistic Processor]
              ├─ Validate & Parse
              ├─ IF translate? → LLM Gemini 2.0 Flash
              └─ LLM Keywords → enriched options
                              ↓
              [Sub-WF 2: JSON Builder + GitHub]
              ├─ Build segments JSON
              ├─ Check SHA → Create or Update
              ├─ IF Success → Admin 1068418205 ✅
              └─ IF Fail   → Admin 1068418205 ❌ + JSON copy
                              ↓
              ← نتيجة ← Sub-WF 1 ← AI Agent → 📱 User
```

---

## ملاحظات مهمة

### النموذج اللغوي
- **AI Agent:** `google/gemini-2.0-flash-exp:free` عبر OpenRouter
- **الترجمة + الكلمات المفتاحية:** نفس النموذج (مجاني)

### إشعارات المشرف (chatId: 1068418205)
- ✅ **عند النجاح:** رسالة تفصيلية مع رابط GitHub المباشر
- ❌ **عند الفشل:** رسالة الخطأ + أول 2500 حرف من JSON للحفظ

### معالجة SHA
- قبل الرفع، يتحقق Sub-WF 2 من وجود الملف في GitHub
- إذا موجود → يأخذ SHA ويُحدّث (بدل إنشاء جديد)
- إذا غير موجود → ينشئ ملفاً جديداً
- بدون هذه الخطوة، GitHub API يرفض التحديث

### الذاكرة
- `Window Buffer Memory` يحفظ 30 رسالة لكل chatId
- المستخدمون المختلفون لهم ذاكرة مستقلة
- تنتهي الذاكرة عند إعادة تشغيل n8n

---

## اختبار الـ Bot

### اختبار بسيط
```
1. أرسل للبوت: /start
2. أرسل النص الألماني مع _____
3. أرسل الخيارات
4. أرسل: auto للترجمة التلقائية
5. أرسل الإجابات والميتاداتا
6. راجع الملخص
7. أرسل: تأكيد
8. تحقق من GitHub و chatId 1068418205
```

### ملف اختبار جاهز (نموذج Maus)
```
النص الألماني: انسخ text_de من s1_m1_maus.json
الخيارات: انسخ الخيارات من نفس الملف
الإجابات: f, e, b, h, c, g, d
القسم: 1 | اسم القسم: LV1
النموذج: 99 | اسم النموذج: Test Workflow
الـ Slug: test-workflow
```
