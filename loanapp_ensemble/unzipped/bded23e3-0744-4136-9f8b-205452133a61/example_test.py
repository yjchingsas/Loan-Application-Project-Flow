import os
import os.path
import sys

sys.path.append('/models/resources/viya/bded23e3-0744-4136-9f8b-205452133a61/')

import _4eciaroqodklgq7s8o0p6y4r5

import settings_bded23e3_0744_4136_9f8b_205452133a61

settings_bded23e3_0744_4136_9f8b_205452133a61.pickle_path = '/models/resources/viya/bded23e3-0744-4136-9f8b-205452133a61/'

def score_record(Delinquencies,DerogatoryMarks,Inquiries,JobType,CredLineAge,CredLines,DebtIncRatio,LoanRequest,HomeValue,Income,LoanToValue,YearsOnJob):
    "Output: P_Default0,P_Default1,I_Default"
    return _4eciaroqodklgq7s8o0p6y4r5.score_method(Delinquencies,DerogatoryMarks,Inquiries,JobType,CredLineAge,CredLines,DebtIncRatio,LoanRequest,HomeValue,Income,LoanToValue,YearsOnJob)

print(score_record(69.20,120.53,75.70,"",62.05,0.07,105.18,108.94,147.57,37.83,94.18,167.39))
