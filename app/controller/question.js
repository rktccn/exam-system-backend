'use strict'

const Controller = require('egg').Controller

class QuestionController extends Controller {
  // 添加题目
  async addQuestion() {
    const { ctx } = this
    const { content, type, score, options } = ctx.request.body
    const questionId = await ctx.service.question.addQuestion({
      content,
      type,
      score
    })

    // 获取到题目id后，再添加题目答案
    for (const option of options) {
      await ctx.service.questionAnswer.addQuestionAnswer({
        questionId,
        content: option.content,
        isCorrect: option.isCorrect,
        score: option.score
      })
    }

    ctx.body = {
      code: 200,
      msg: '添加成功',
      data: {
        questionId
      }
    }
  }

  // 获取题目列表及答案
  async getQuestionList() {
    const { ctx } = this
    const limit = parseInt(ctx.query.limit)
    const offset = parseInt(ctx.query.offset)
    const key = ctx.query.key
    const questionList = await ctx.service.question.getQuestionList(
      limit,
      offset,
      key
    )

    // 获取题目列表后，再获取题目答案
    for (const question of questionList.rows) {
      question.options = await ctx.service.questionAnswer.getQuestionAnswer(
        question.questionId
      )
    }

    ctx.body = {
      code: 200,
      msg: '获取成功',
      data: {
        questionList
      }
    }
  }

  // 修改题目
  async updateQuestion() {
    const { ctx } = this
    const { questionId, content, type, score, options } = ctx.request.body
    const result = await ctx.service.question.updateQuestion(
      questionId,
      content,
      score,
      type
    )
    // 修改题目后，再修改题目答案
    await ctx.service.questionAnswer.deleteQuestionAnswer(questionId)

    for (const option of options) {
      // 先删除后添加
      await ctx.service.questionAnswer.addQuestionAnswer({
        questionId,
        content: option.content,
        isCorrect: option.isCorrect,
        score: option.score
      })
    }

    ctx.body = {
      code: 200,
      msg: '修改成功',
      data: {}
    }
  }

  // 搜索题目
  async searchQuestion() {
    const { ctx } = this
    const { key, limit, offset } = ctx.request.body
    const questionList = await ctx.service.question.searchQuestion(
      key,
      limit,
      offset
    )
  }
}

module.exports = QuestionController
