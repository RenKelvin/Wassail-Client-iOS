//
//  HLProgramInstanceRequirements.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 11/1/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import Foundation
import CoreData

@objc(HLProgramInstanceRequirements)
class HLProgramInstanceRequirements: NSManagedObject {
    
    @NSManaged var programInstanceId: NSNumber
    @NSManaged var applicationFeeHas: NSNumber
    @NSManaged var applicationFee: NSNumber
    @NSManaged var toeflHas: NSNumber
    @NSManaged var toeflIBTTotal: NSNumber
    @NSManaged var ieltsHas: NSNumber
    @NSManaged var ieltsTotal: NSNumber
    @NSManaged var greHas: NSNumber
    @NSManaged var greTotal: NSNumber
    @NSManaged var transcriptHas: NSNumber
    @NSManaged var psHas: NSNumber
    @NSManaged var resumeHas: NSNumber
    @NSManaged var recommendationHas: NSNumber
    @NSManaged var recommendationNum: NSNumber
    @NSManaged var satoractHas: NSNumber
    @NSManaged var satSubjectTestsHas: NSNumber
    @NSManaged var apExamsHas: NSNumber
    @NSManaged var writingSampleHas: NSNumber
    @NSManaged var teacherEvaluationsHas: NSNumber
    @NSManaged var schoolReportHas: NSNumber
    @NSManaged var scoreChoiceHas: NSNumber
    
    var data: NSArray?
    
    func configure(dict: NSDictionary) {
        let json: JSON = JSON(dict) as JSON
        
        programInstanceId = json["programInstanceId"].intValue
        applicationFeeHas = json["ApplicationFeeHas"].boolValue
        applicationFee = json["ApplicationFee"].doubleValue
        toeflHas = json["ToeflHas"].boolValue
        toeflIBTTotal = json["ToeflIBTTotal"].intValue
        ieltsHas = json["IeltsHas "].boolValue
        ieltsTotal = json["IeltsTotal"].doubleValue
        greHas = json["GreHas"].boolValue
        greTotal = json["GreTotal"].intValue
        transcriptHas = json["TranscriptHas"].boolValue
        psHas = json["PsHas"].boolValue
        resumeHas = json["ResumeHas"].boolValue
        recommendationHas = json["RecommendationHas"].boolValue
        recommendationNum = json["RecommendationNum"].intValue
        satoractHas = json["SATorACTHas"].boolValue
        satSubjectTestsHas = json["SATsubjecttestsHas"].boolValue
        apExamsHas = json["APExamsHas "].boolValue
        writingSampleHas = json["WritingSampleHas"].boolValue
        teacherEvaluationsHas = json["TeacherEvaluationsHas"].boolValue
        schoolReportHas = json["SchoolReportHas"].boolValue
        scoreChoiceHas = json["ScoreChoiceHas"].boolValue
    }
    
    func getRequirements() -> NSArray {
        
        if (data != nil) {
            return data!
        }
        
        let array = NSMutableArray()
        
        array.addObject(self.getExamsRequirements())
        array.addObject(self.getDocsRequirements())
        array.addObject(self.getFeeRequirements())
        
        data = array
        return array
    }
    
    func getAllCount() -> Int {
        var count = 0
        
        count += self.getExamsRequirements().count
        count += self.getDocsRequirements().count
        count += self.getFeeRequirements().count
        
        return count
    }
    
    func getExamsRequirements() -> NSArray {
        let array = NSMutableArray()
        
        var ind = 0
        var title = ""
        var note = ""
        
        // 101 toefl
        if (toeflHas.boolValue) {
            ind = 101
            title = "TOEFL"
            note = NSString(format: "寄送托福成绩") as String
            if (0 < toeflIBTTotal.intValue && toeflIBTTotal.intValue <= 120) {
                note += NSString(format: " 分数要求 %d", toeflIBTTotal.integerValue) as String
            }
            
            array.addObject([ind, title, note])
        }
        
        // 102 ielts
        if (ieltsHas.boolValue) {
            ind = 102
            title = "IELTS"
            note = NSString(format: "寄送雅思成绩") as String
            if (ieltsTotal.doubleValue != 0.0) {
                note += NSString(format: " 分数要求 %.1f", ieltsTotal.doubleValue) as String
            }
            
            array.addObject([ind, title, note])
        }
        
        // 103 gre
        if (greHas.boolValue) {
            ind = 103
            title = "GRE"
            note = NSString(format: "寄送GRE成绩", greTotal.integerValue) as String
            if (greTotal.doubleValue != 0) {
                note += NSString(format: " 分数要求 %d", greTotal.integerValue) as String
            }
            
            array.addObject([ind, title, note])
        }
        
        // 104 sat or act
        if (satoractHas.boolValue) {
            ind = 101
            title = "SAT or ACT"
            note = "寄送SAT或ACT成绩"
            
            array.addObject([ind, title, note])
        }
        
        // 105 ap
        if (apExamsHas.boolValue) {
            ind = 105
            title = "AP"
            note = "寄送AP考试成绩"
            
            array.addObject([ind, title, note])
        }
        
        return array
    }
    
    func getDocsRequirements() -> NSArray {
        let array = NSMutableArray()
        
        var ind = 0
        var title = ""
        var note = ""
        
        // 201 ps
        if (psHas.boolValue) {
            ind = 201
            title = "Personal Statement"
            note = "提交个人陈述"
            
            array.addObject([ind, title, note])
        }
        
        // 202 cv
        if (resumeHas.boolValue) {
            ind = 202
            title = "Resume / CV"
            note = "提交个人简历"
            
            array.addObject([ind, title, note])
        }
        
        // 203 rl
        if (recommendationHas.boolValue) {
            ind = 203
            title = "Recomendation Letter"
            note = NSString(format: "提交推荐信") as String
            if (recommendationNum.intValue != 0) {
                note += NSString(format: " 要求%d封", recommendationNum.intValue) as String
            }

            array.addObject([ind, title, note])
        }
        
        // 204 ws
        if (writingSampleHas.boolValue) {
            ind = 204
            title = "Writing Sample"
            note = "提交写作示例"
            
            array.addObject([ind, title, note])
        }
        
        // 205 ts
        if (transcriptHas.boolValue) {
            ind = 205
            title = "Transcript"
            note = "提交成绩单"
            
            array.addObject([ind, title, note])
        }
        
        return array
    }
    
    func getFeeRequirements() -> NSArray {
        let array = NSMutableArray()
        
        var ind = 0
        var title = ""
        var note = ""
        
        // 305 af
        ind = 305
        title = "Application Fee"
        note = NSString(format: "提交申请费") as String
        if (applicationFee.doubleValue != 0.0) {
            note += NSString(format: " $%d", applicationFee.integerValue) as String
        }
        
        array.addObject([ind, title, note])
        
        return array
    }
    
}
