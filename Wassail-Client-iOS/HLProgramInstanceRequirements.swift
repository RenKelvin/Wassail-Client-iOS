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

}
