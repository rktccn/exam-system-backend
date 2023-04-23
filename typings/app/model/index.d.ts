// This file is created by egg-ts-helper@1.34.7
// Do not modify this file!!!!!!!!!
/* eslint-disable */

import 'egg';
import ExportAnswerRecord = require('../../../app/model/AnswerRecord');
import ExportPaper = require('../../../app/model/Paper');
import ExportPaperQuestion = require('../../../app/model/PaperQuestion');
import ExportQuestion = require('../../../app/model/Question');
import ExportQuestionOption = require('../../../app/model/QuestionOption');
import ExportRole = require('../../../app/model/role');
import ExportScore = require('../../../app/model/Score');
import ExportTeacherStudent = require('../../../app/model/TeacherStudent');

declare module 'egg' {
  interface IModel {
    AnswerRecord: ReturnType<typeof ExportAnswerRecord>;
    Paper: ReturnType<typeof ExportPaper>;
    PaperQuestion: ReturnType<typeof ExportPaperQuestion>;
    Question: ReturnType<typeof ExportQuestion>;
    QuestionOption: ReturnType<typeof ExportQuestionOption>;
    Role: ReturnType<typeof ExportRole>;
    Score: ReturnType<typeof ExportScore>;
    TeacherStudent: ReturnType<typeof ExportTeacherStudent>;
  }
}
