'use strict'

const service = require('egg').Service

class Question extends service {
  // 添加题目

  // data: {
  //   teacherId,
  //   content,
  //   type,
  //   score,
  // }
  async addQuestion(data) {
    const { ctx } = this
    const result = await ctx.model.Question.create(data)
    return result.toJSON().id
  }

  // 获取题目
  async getQuestion(questionId) {
    const { ctx } = this
    const result = await ctx.model.Question.findAll({
      where: {
        questionId
      }
    })
    return result.toJSON()
  }

  // 获取题目列表
  async getQuestionList(teacherId) {
    const { ctx } = this
    const res = await ctx.model.Question.findAll({
      where: {
        teacherId
      }
    })

    return res.map((item) => {
      return item.toJSON()
    })
  }

  // 修改题目
  async updateQuestion(questionId, content, score) {
    const { ctx } = this
    const result = await ctx.model.Question.update({
      content, score
    }, {
      where: {
        questionId
      }
    })
    return result
  }
}

module.exports = Question
