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

  // 获取全部试卷列表
  async getPaperList() {
    const { ctx } = this
    const { offset, limit, type } = ctx.query
    const result = await ctx.service.paper.getPaperList(parseInt(limit), parseInt(offset), parseInt(type))
    ctx.body = result
  }

  // 获取学生试卷列表
  async getStudentPaperList() {
    const { ctx } = this
    const { offset, limit, studentId, type } = ctx.query
    const paperList = await ctx.service.studentPaper.getPaperList(parseInt(studentId), parseInt(limit), parseInt(offset), parseInt(type))

    //
    // let res = []
    // // 获取试卷详情
    // for (const paper of paperList.rows) {
    //   res.push(await ctx.service.paper.getPaperDetail(paper.paperId))
    // }
    ctx.body = paperList
  }

  // 获取试卷详情
  async getPaperDetail() {
    const { ctx } = this
    const { paperId } = ctx.query
    // 获取试卷信息
    const paper = await ctx.service.paper.getPaperDetail(paperId)
    // 获取题目
    const questionList = await ctx.service.paperQuestion.getPaperQuestionList(paperId)
    // 获取题目列表后，再获取题目答案
    for (const question of questionList) {
      question.options = await ctx.service.questionAnswer.getQuestionAnswer(question.questionId)
    }
    // 获取学生信息
    const studentList = await ctx.service.studentPaper.getStudentList(paperId)

    ctx.body = {
      code: 200,
      msg: '获取成功',
      data: {
        paper,
        questionList,
        studentList
      }
    }

  }

  // 获取考试（不包含正确答案）
  async getExam() {
    const { ctx } = this
    const { studentPaperId, userId } = ctx.query

    // 获取学生试卷关联信息
    const studentPaper = await ctx.service.studentPaper.getStudentPaper(studentPaperId)

    // 检测考生
    // if (studentPaper.studentId !== parseInt(userId)) {
    //   ctx.body = {
    //     code: 400,
    //     msg: '考生信息错误'
    //   }
    //   return
    //
    // }

    // 判断是否已经考试
    // if (studentPaper.status === 1) {
    //   ctx.body = {
    //     code: 400,
    //     msg: '已经考试'
    //   }
    //   return
    // }

    const paperId = studentPaper.paperId
    // 获取试卷信息
    const paper = await ctx.service.paper.getPaperDetail(paperId)

    // 判断是否在考试时间内
    const now = new Date()
    // if (now < paper.startTime || now > paper.endTime) {
    //   ctx.body = {
    //     code: 400,
    //     msg: '不在考试时间内'
    //   }
    //   return
    // }

    // 获取题目关联
    const questionList = await ctx.service.paperQuestion.getPaperQuestionList(paperId)
    // 获取题目列表后，再获取题目和答案
    for (const question of questionList) {
      question.question = await ctx.service.question.getQuestion(question.questionId)
      question.options = await ctx.service.questionAnswer.getQuestionAnswerExcludeCorrect(question.questionId)
    }
    // 提交答题时间
    await ctx.service.studentPaper.updateStudentPaper({
      studentPaperId,
      answerTime: now
    })

    ctx.body = {
      code: 200,
      msg: '获取成功',
      data: {
        paper,
        questionList
      }
    }
  }

  // 提交试卷
  async submitPaper() {
    const { ctx } = this
    const { studentPaperId, answers } = ctx.request.body
    let score = 0

    // 判断答案是否正确
    for (const answer of answers) {
      // 获取正确答案
      const correctAnswer = await ctx.service.questionAnswer.getQuestionCorrectAnswer(answer.questionId)
      // 获取题目，获得小题分数
      const question = await ctx.service.question.getQuestion(answer.questionId)
      let option,
        isCorrect = false

      // 选择题处理
      if (answer.type <= 1) {
        // 创建答案列表
        option = []

        correctAnswer.forEach(item => {
          option.push(item.questionOptionId)
        })
        // 判断答案是否正确
        if (answer.option.sort()
          .toString() === option.sort()
          .toString()) {
          score += question.score
          isCorrect = true
        }
      } else {
        if (answer.type === 3) {
          option = answer.option ? '正确' : '错误'
        } else {
          option = answer.option
        }

        if (option === correctAnswer[0].content) {
          score += question.score
          isCorrect = true
        }
      }

      // 添加答题信息
      await ctx.service.paperAnswer.createPaperAnswer({
        studentPaperId,
        questionId: answer.questionId,
        content: option.toString(), // 选择题答案为数组，其他为字符串
        isCorrect
      })
    }


    // 更新关联信息
    await ctx.service.studentPaper.updateStudentPaper({
      studentPaperId,
      score,
      status: 1,
      submitTime: new Date()
    })

    ctx.body = {
      code: 200,
      msg: '更新成功',
      data: {
        score
      }
    }
  }

  // 获取考试结果
  async getExamResult() {
    const { ctx } = this
    const { studentPaperId } = ctx.query
    const studentPaper = await ctx.service.studentPaper.getStudentPaper(studentPaperId)

    // 获取试卷信息
    const paper = await ctx.service.paper.getPaperDetail(studentPaper.paperId)

    // 获取题目及答题信息
    const questionList = await ctx.service.paperQuestion.getPaperQuestionList(studentPaper.paperId)
    // 获取题目列表后，再获取题目和答案
    for (const question of questionList) {
      question.question = await ctx.service.question.getQuestion(question.questionId)
      question.options = await ctx.service.questionAnswer.getQuestionAnswer(question.questionId)
      question.answer = await ctx.service.paperAnswer.getPaperAnswer(studentPaperId, question.questionId)
    }


    ctx.body = {
      code: 200,
      msg: '获取成功',
      data: {
        studentPaper,
        paper,
        questionList
      }
    }
  }
}


module.exports = PaperController
