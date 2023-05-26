'use strict'

const service = require('egg').Service

class PaperQuestion extends service {
  // 创建试卷题目关联
  async createPaperQuestion(data) {
    const { ctx } = this
    const result = await ctx.model.PaperQuestion.create(data)
    return result.toJSON().paperQuestionId
  }

  // 获取试卷题目关联
  async getPaperQuestionList(paperId) {
    const { ctx } = this
    const result = await ctx.model.PaperQuestion.findAll({
      where: {
        paperId
      }
    })
    return result.map(item => item.toJSON())
  }
}

module.exports = PaperQuestion
