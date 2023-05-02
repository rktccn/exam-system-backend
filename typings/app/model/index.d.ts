// This file is created by egg-ts-helper@1.34.7
// Do not modify this file!!!!!!!!!
/* eslint-disable */

import 'egg';
import ExportPaper = require('../../../app/model/Paper');
import ExportPaperAnswer = require('../../../app/model/PaperAnswer');
import ExportPaperQuestion = require('../../../app/model/PaperQuestion');
import ExportQuestion = require('../../../app/model/Question');
import ExportQuestionOption = require('../../../app/model/QuestionOption');
import ExportRole = require('../../../app/model/role');
import ExportStudentPaper = require('../../../app/model/StudentPaper');
import ExportTeacherStudent = require('../../../app/model/TeacherStudent');

declare module 'egg' {
  interface IModel {
    Paper: ReturnType<typeof ExportPaper>;
    PaperAnswer: ReturnType<typeof ExportPaperAnswer>;
    PaperQuestion: ReturnType<typeof ExportPaperQuestion>;
    Question: ReturnType<typeof ExportQuestion>;
    QuestionOption: ReturnType<typeof ExportQuestionOption>;
    Role: ReturnType<typeof ExportRole>;
    StudentPaper: ReturnType<typeof ExportStudentPaper>;
    TeacherStudent: ReturnType<typeof ExportTeacherStudent>;
  }
}
