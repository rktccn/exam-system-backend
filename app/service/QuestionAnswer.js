'use strict'

const Service = require('egg').Service

class QuestionAnswer extends Service {

  // 添加题目答案
  // data: {
  //   questionId,
  //   teacherId,
  //   content,
  //   isCorrect,
  //   score,
  // }
  async addQuestionAnswer(data) {
    const { ctx } = this
    const result = await ctx.model.QuestionOption.create(data)
    return result.toJSON().questionOptionId
  }


  // 获取题目选项
  async getQuestionAnswer(questionId) {
    const { ctx } = this
    const res = await ctx.model.QuestionOption.findAll({
      where: {
        questionId
      }
    })
    return res.map((item) => {
      return item.toJSON()
    })
  }

  // 获取题目选项，排除是否为正确答案
  async getQuestionAnswerExcludeCorrect(questionId) {
    const { ctx } = this
    const res = await ctx.model.QuestionOption.findAll({
      attributes: [ 'questionOptionId', 'content', 'questionId', 'createdAt', 'updatedAt' ],
      where: {
        questionId
      }
    })
    return res.map((item) => {
      return item.toJSON()
    })
  }

  // 获取题目正确答案
  async getQuestionCorrectAnswer(questionId) {
    const { ctx } = this
    const result = await ctx.model.QuestionOption.findAll({
      where: {
        questionId,
        isCorrect: 1
      }
    })
    return result.map((item) => {
      return item.toJSON()
    })
  }

  // 修改题目答案
  async updateQuestionAnswer(questionId, answer) {
    const { ctx } = this
    const result = await ctx.model.QuestionOption.update({
      answer
    }, {
      where: {
        questionId
      }
    })
    return result
  }

  // 删除题目答案
  async deleteQuestionAnswer(questionId) {
    const { ctx } = this
    const result = await ctx.model.QuestionOption.destroy({
      where: {
        questionId
      }
    })
    return result
  }
}

module.exports = QuestionAnswer
