// This file is created by egg-ts-helper@1.34.7
// Do not modify this file!!!!!!!!!
/* eslint-disable */

import 'egg';
import ExportHome = require('../../../app/controller/home');
import ExportPaper = require('../../../app/controller/Paper');
import ExportQuestion = require('../../../app/controller/question');
import ExportRole = require('../../../app/controller/role');

declare module 'egg' {
  interface IController {
    home: ExportHome;
    paper: ExportPaper;
    question: ExportQuestion;
    role: ExportRole;
  }
}
