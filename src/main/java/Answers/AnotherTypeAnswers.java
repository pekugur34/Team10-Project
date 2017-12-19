/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Answers;

import Questions.AnotherTypeQuestions;
import java.util.concurrent.ThreadLocalRandom;

/*
 * Author:Uğur Pek
 * Created Date:18.12.2017
 * 
 * */

public class AnotherTypeAnswers {
    private static final String[] answers={"Harika !","Mükemmel !","Müthiş !"};
    
    private static String[] questions=AnotherTypeQuestions.getQuestions();
    
    public static String giveAnswer(){
        int index=ThreadLocalRandom.current().nextInt(0,answers.length);
        
        return answers[index]+"sadas";
    }
    
    @Override
    public String toString(){
        return "Another Type Answers";
    }
}
