// This file is created by egg-ts-helper@1.34.7
// Do not modify this file!!!!!!!!!
/* eslint-disable */

import 'egg';
type AnyClass = new (...args: any[]) => any;
type AnyFunc<T = any> = (...args: any[]) => T;
type CanExportFunc = AnyFunc<Promise<any>> | AnyFunc<IterableIterator<any>>;
type AutoInstanceType<T, U = T extends CanExportFunc ? T : T extends AnyFunc ? ReturnType<T> : T> = U extends AnyClass ? InstanceType<U> : U;
import ExportQuestion = require('../../../app/service/question');
import ExportQuestionAnswer = require('../../../app/service/QuestionAnswer');
import ExportRole = require('../../../app/service/role');

declare module 'egg' {
  interface IService {
    question: AutoInstanceType<typeof ExportQuestion>;
    questionAnswer: AutoInstanceType<typeof ExportQuestionAnswer>;
    role: AutoInstanceType<typeof ExportRole>;
  }
}
