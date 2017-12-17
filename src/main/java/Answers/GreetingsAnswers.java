package Answers;

import java.util.Arrays;
import java.util.concurrent.ThreadLocalRandom;

import Questions.GreetingsQuestions;

/*
 * Author:Uğur Pek
 * Created Date:08.11.2017
 * 
 * */
public class GreetingsAnswers {
    //Members

    private static final String[] greetings = {"Selam !","Selam","Selam", "Selamlar !", "Merhaba !", "Merhabalar !"};
    private static final String[] endings = {"Görüşmek üzere", "görüşürüz", "güle güle", "Hoşçakal"};

    private static String[] questionGreetings = GreetingsQuestions.getGreetings();

    //Methods
    public static String greet() {

        int index = ThreadLocalRandom.current().nextInt(0, greetings.length);

        return greetings[index];

        
    }

    public static String[] getGreetings() {
        return greetings;
    }

    public static String[] getEndings() {
        return endings;
    }

}//end of class
