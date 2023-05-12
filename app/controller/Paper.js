'use strict'

const Controller = require('egg').Controller

class PaperController extends Controller {
  // 创建试卷
  async createPaper() {
    const { ctx } = this
    const { teacherId, title, timeRange, questions, students, totalScore } = ctx.request.body

    const paperId = await ctx.service.paper.createPaper({
      teacherId,
      paperName: title,
      startTime: new Date(timeRange[0]),
      endTime: new Date(timeRange[1]),
      totalScore
    })

    // 创建试卷题目关联
    for (let i = 0; i < questions.length; i++) {
      const questionId = questions[i]
      await ctx.service.paperQuestion.createPaperQuestion({
        paperId,
        questionId
      })
    }

    // 创建学生试卷关联
    for (let i = 0; i < students.length; i++) {
      const studentId = students[i]
      await ctx.service.studentPaper.createStudentPaper({
        studentId,
        paperId
      })
    }

    ctx.body = {
      paperId
    }
  }

  // 获取试卷列表
  async getPaperList() {
    const { ctx } = this
    // const { page, limit } = ctx.query
    const result = await ctx.service.paper.getPaperList()

    // 获取题目
    for (let i = 0; i < result.rows.length; i++) {
      const paper = result.rows[i]
      result.rows[i].questionList = await ctx.service.paperQuestion.getPaperQuestionList(paper.id)
    }

    // 获取学生
    for (let i = 0; i < result.rows.length; i++) {
      const paper = result.rows[i]
      result.rows[i].studentList = await ctx.service.studentPaper.getStudentList(paper.id)
    }

    ctx.body = result
  }
}


module.exports = PaperController
