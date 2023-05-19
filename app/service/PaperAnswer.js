'use strict'

const service = require('egg').Service

class PaperAnswer extends service {

  // 添加答题记录
  async createPaperAnswer(data) {
    const { ctx } = this
    const result = await ctx.model.PaperAnswer.create(data)
    return result.toJSON().paperAnswerId
  }

  // 获取答题记录
  async getPaperAnswer(studentPaperId, questionId) {
    const { ctx } = this
    const result = await ctx.model.PaperAnswer.findAll({
      where: {
        studentPaperId,
        questionId
      }
    })
    return result
  }

}

module.exports = PaperAnswer
