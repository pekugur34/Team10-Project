/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Process;

import General.FindPOS;
import static Process.ScoringSentences.stems;
import Search.SearchQuery;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import zemberek.morphology.analysis.SentenceAnalysis;
import zemberek.morphology.analysis.tr.TurkishMorphology;
import zemberek.morphology.analysis.tr.TurkishSentenceAnalyzer;
import zemberek.tokenization.TurkishTokenizer;

/**
 *
 * @author LordAvalon
 */
public class Score {

    
    private static ArrayList<String> selectCandidateAnswers(String question, TurkishMorphology morphology, TurkishTokenizer tokenizer, TurkishSentenceAnalyzer analyzer) {
        ArrayList<String> finalAnswers = new ArrayList<String>();
        SentenceAnalysis analysis = new SentenceAnalysis();
        try {
            ArrayList<String> lstParagraphs = SearchQuery.getParagraphsFromPages(question);
            List<String> stemsOfQuestion = stems(question, morphology, tokenizer);//Stemming Question

            int sizeOfQuestion = stemsOfQuestion.size();

            String firstPropNoun = FindPOS.test(question, analyzer);

            for (int i = 0; i < lstParagraphs.size(); i++) {
                List<String> stemsOfAnswer = stems(lstParagraphs.get(i), morphology, tokenizer);//For every Answer
                ArrayList<String> commonElements = new ArrayList<>(stemsOfAnswer);

                commonElements.retainAll(stemsOfQuestion);//Compare and remove different elements

                if ((sizeOfQuestion / 2) <= commonElements.size()) {//First rule approved.
                    analysis = analyzer.analyze(question);
                    analyzer.disambiguate(analysis);

                    if (commonElements.contains(firstPropNoun)) {//Second Rule
                        finalAnswers.add(lstParagraphs.get(i));
                    }
                }
            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return finalAnswers;
    }

    public static float score(String question, String answer) {
        //String question="Mustafa Kemal Atatürk kimdir";
        //String answer="Atatürk Birinci Dünya Savaşı sırasında Osmanlı ordusuna hizmet veriyordu; Çanakkale Cephesi'nde albaylığa, Sina-Filistin Cephesi'nde ise Yıldırım Orduları (7. Ordu) generalliğine atanmıştır.";
        //
        long cK = StringUtils.countMatches(answer, question);
        long sK = question.chars().count();
        //int tP=0;

        String[] qA = question.split(" ");
        String[] aA = answer.split(" ");

        int count = 1;

        for (int i = 0; i < qA.length; i++) {
            for (int j = 0; j < aA.length; j++) {
                if (qA[i].equalsIgnoreCase(aA[j])) {
                    count++;
                }
            }
        }

        float sP = 1.f * (10 * count * (count - 1)) / sK;

        return sP;
    }

}
