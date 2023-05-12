// This file is created by egg-ts-helper@1.34.7
// Do not modify this file!!!!!!!!!
/* eslint-disable */

import 'egg';
type AnyClass = new (...args: any[]) => any;
type AnyFunc<T = any> = (...args: any[]) => T;
type CanExportFunc = AnyFunc<Promise<any>> | AnyFunc<IterableIterator<any>>;
type AutoInstanceType<T, U = T extends CanExportFunc ? T : T extends AnyFunc ? ReturnType<T> : T> = U extends AnyClass ? InstanceType<U> : U;
import ExportPaper = require('../../../app/service/Paper');
import ExportPaperQuestion = require('../../../app/service/PaperQuestion');
import ExportQuestion = require('../../../app/service/question');
import ExportQuestionAnswer = require('../../../app/service/QuestionAnswer');
import ExportRole = require('../../../app/service/role');
import ExportStudentPaper = require('../../../app/service/StudentPaper');

declare module 'egg' {
  interface IService {
    paper: AutoInstanceType<typeof ExportPaper>;
    paperQuestion: AutoInstanceType<typeof ExportPaperQuestion>;
    question: AutoInstanceType<typeof ExportQuestion>;
    questionAnswer: AutoInstanceType<typeof ExportQuestionAnswer>;
    role: AutoInstanceType<typeof ExportRole>;
    studentPaper: AutoInstanceType<typeof ExportStudentPaper>;
  }
}
