/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Process;

import org.apache.commons.lang3.StringUtils;


/**
 *
 * @author LordAvalon
 */
public class Score {
    public static float score(String question,String answer) {
        //String question="Mustafa Kemal Atatürk kimdir";
        //String answer="Atatürk Birinci Dünya Savaşı sırasında Osmanlı ordusuna hizmet veriyordu; Çanakkale Cephesi'nde albaylığa, Sina-Filistin Cephesi'nde ise Yıldırım Orduları (7. Ordu) generalliğine atanmıştır.";
        //
        long cK=StringUtils.countMatches(answer, question);
        long sK=question.chars().count();
        //int tP=0;
        
        String[] qA=question.split(" ");
        String[] aA=answer.split(" ");
        
        int count=1;
        
        for(int i=0;i<qA.length;i++){
            for(int j=0;j<aA.length;j++){
                if(qA[i].equalsIgnoreCase(aA[j])){
                    count++;
                }
            }
        }
        
        float sP=1.f*(10*count*(count-1))/sK;
        
        return sP;
    }
    

    
    
}
