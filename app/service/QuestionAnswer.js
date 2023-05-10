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
    return result.toJSON().id
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

  // 获取题目正确答案
  async getQuestionCorrectAnswer(questionId) {
    const { ctx } = this
    const result = await ctx.model.QuestionAnswer.findAll({
      where: {
        questionId,
        isCorrect: 1
      }
    })
    return result.toJSON()
  }

  // 修改题目答案
  async updateQuestionAnswer(questionId, answer) {
    const { ctx } = this
    const result = await ctx.model.QuestionAnswer.update({
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
    const result = await ctx.model.QuestionAnswer.destroy({
      where: {
        questionId
      }
    })
    return result
  }
}

module.exports = QuestionAnswer
