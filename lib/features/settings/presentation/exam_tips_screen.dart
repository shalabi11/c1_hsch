import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/localization/locale_provider.dart';

class ExamTipsScreen extends ConsumerWidget {
  const ExamTipsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final isArabic = locale.languageCode == 'ar';

    String tr(String ar, String de) => isArabic ? ar : de;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tr('نصائح للامتحان', 'Prüfungstipps'),
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: AppColors.accent),
      ),
      body: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            Text(
              tr('قسم الاستماع (Hörverstehen)', 'Hörverstehen'),
              style: AppTextStyles.headingMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildTipCard(
              context: context,
              title: 'HV2',
              score: tr('20 علامة', '20 Punkte'),
              color: Colors.blue,
              icon: Icons.headphones,
              tips: [
                tr('البدء بهذا القسم لضمان 20 علامة.',
                    'Beginne hiermit, um 20 Punkte zu sichern.'),
                tr('يحتاج يوم دراسة ويوم للتأكيد والحل عن طريق النماذج.',
                    'Benötigt einen Tag zum Lernen und einen Tag zum Üben mit Mustertests.'),
                tr('نصيحة: طباعة هذا القسم (Teil) واستخدام الهايلايتر لتحديد الإجابات الصحيحة يساعد العين على تألف الجواب بشكل أسرع.',
                    'Tipp: Drucke diesen Teil aus und markiere die richtigen Antworten mit einem Textmarker. Das hilft dem Auge, sich schneller an die Antworten zu gewöhnen.'),
              ],
            ),
            const SizedBox(height: 12),
            _buildTipCard(
              context: context,
              title: 'HV1',
              score: tr('8 علامات', '8 Punkte'),
              color: Colors.orange,
              icon: Icons.lightbulb,
              tips: [
                tr('الحفظ عن طريق قصص سريعة يحتاج ساعتين دراسة على مجال يومين فقط.',
                    'Auswendiglernen durch kurze Geschichten erfordert nur 2 Stunden Lernen verteilt auf 2 Tage.'),
                tr('التثبيت عن طريق حل النماذج.',
                    'Festigung durch das Lösen von Mustertests.'),
                tr('القسم سهل جداً، احفظ الكلمات بالألماني وبالعربي كقصص لكي تتذكرها فور رؤيتها.',
                    'Der Teil ist sehr einfach, lerne die Wörter auf Deutsch und Arabisch als Geschichten.'),
                tr('الانتباه للتعديلات: دائماً في بعض الاختلافات بنصين (مثل Studienfinanzierung).',
                    'Achte auf Änderungen: Es gibt immer einige Unterschiede in zwei Texten (z. B. Studienfinanzierung).'),
                tr('يوجد تعديل في أحد النصوص حيث تتغير الكلمة من besser إلى beruflich.',
                    'Es gibt eine Änderung in einem Text, in der das Wort von besser auf beruflich geändert wird.'),
              ],
            ),
            const SizedBox(height: 12),
            _buildTipCard(
              context: context,
              title: 'HV3',
              score: tr('20 علامة', '20 Punkte'),
              color: Colors.purple,
              icon: Icons.edit_note,
              tips: [
                tr('قسم يشاع أنه صعب لكن أفضل طريقة لدراسته هي حفظ الإجابات مع الأسئلة التي تسبق المربع.',
                    'Es wird oft gesagt, dass dieser Teil schwer ist, aber der beste Weg, ihn zu lernen, ist, die Antworten zusammen mit den Fragen auswendig zu lernen.'),
                tr('يجب فهم السؤال المطروح وليس فقط بصم الإجابات.',
                    'Man muss die gestellte Frage verstehen und nicht nur die Antworten auswendig lernen.'),
                tr('يحتاج إعادة مرتين، وعند الإعادة يُنصح بسماع التسجيلات الصوتية والحل لتهيئة نفسك لجو الفحص.',
                    'Es erfordert zweimaliges Wiederholen. Höre dir beim Wiederholen die Aufnahmen an, um dich auf die Prüfungsatmosphäre vorzubereiten.'),
                tr('يحتاج أسبوع كامل مخصص لدراسته والتكرار.',
                    'Es bedarf einer ganzen Woche, die nur dem Lernen und Wiederholen dieses Teils gewidmet ist.'),
                tr('يجب التدرب على أول مرتين بالكتابة باليد لتعلم كتابة بعض الكلمات لغوياً بشكل صحيح.',
                    'Die ersten zwei Male sollte handschriftlich geübt werden, um die korrekte Rechtschreibung zu erlernen.'),
                tr('باقي 3/4 لم تتسرب حتى الآن، ويُنصح بقراءة وترجمة النصوص غير المسربة.',
                    'Die restlichen 3/4 wurden noch nicht geleakt, es wird empfohlen, die nicht geleakten Texte zu lesen und zu übersetzen.'),
                tr('الإجابات واضحة وتُسمع بنسبة 70٪.',
                    'Die Antworten sind klar und zu 70% gut hörbar.'),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              tr('قسم القراءة (Leseverstehen)', 'Leseverstehen'),
              style: AppTextStyles.headingMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildTipCard(
              context: context,
              title: 'LV3',
              score: tr('24 علامة', '24 Punkte'),
              color: Colors.teal,
              icon: Icons.check_circle_outline,
              tips: [
                tr('البدء بهذا القسم، علاماته مضمونة.',
                    'Beginne mit diesem Teil, die Punkte sind sicher.'),
                tr('حفظ الـ X والصحيح والعنوان.',
                    'Merke dir das X, das Richtige und den Titel.'),
                tr('الانتباه في النماذج الجديدة للتعديلات في بعض الأقسام.',
                    'Achte in den neuen Mustertests auf Änderungen in einigen Teilen.'),
                tr('القسم كاملاً بتركيز يحتاج 3 أيام ويومين إعادة عن طريق حل النماذج.',
                    'Der gesamte Teil erfordert 3 Tage konzentriertes Lernen und 2 Tage Wiederholung durch Mustertests.'),
              ],
            ),
            const SizedBox(height: 12),
            _buildTipCard(
              context: context,
              title: 'LV1',
              score: tr('12 علامة', '12 Punkte'),
              color: Colors.green,
              icon: Icons.article,
              tips: [
                tr('الحفظ كقصص يحتاج يوم واحد.',
                    'Auswendiglernen als Geschichten benötigt einen Tag.'),
                tr('يوم للمراجعة.', 'Ein Tag zur Wiederholung.'),
                tr('يوم للحل عن طريق النماذج.',
                    'Ein Tag zum Üben mit Mustertests.'),
              ],
            ),
            const SizedBox(height: 12),
            _buildTipCard(
              context: context,
              title: 'LV2',
              score: tr('12 علامة', '12 Punkte'),
              color: Colors.indigo,
              icon: Icons.find_in_page,
              tips: [
                tr('علامات مضمونة بإذن الله، لكن قد يتم تغيير سؤال أو سؤالين.',
                    'Sichere Punkte, aber es könnten sich ein oder zwei Fragen ändern.'),
                tr('يحتاج كدراسة مطلقة لحد الـ 3 أيام كقصص أو اختصارات.',
                    'Erfordert bis zu 3 Tage intensives Lernen als Geschichten oder Abkürzungen.'),
                tr('ثم فتح النصوص والتدريب على النموذج.',
                    'Danach die Texte öffnen und mit Mustertests üben.'),
                tr('يوجد لبعض النصوص أكثر من اسم في هذا القسم، انتبه أثناء الحل.',
                    'Einige Texte in diesem Teil haben mehrere Namen, sei vorsichtig beim Lösen.'),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard({
    required BuildContext context,
    required String title,
    required String score,
    required Color color,
    required IconData icon,
    required List<String> tips,
  }) {
    return Card(
      elevation: 0,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: ExpansionTile(
        shape: const Border(), // Remove default expansion borders
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Row(
          children: [
            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                score,
                style: AppTextStyles.labelSmall.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        childrenPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        children: tips.map((tip) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle, size: 16, color: color),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    tip,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
