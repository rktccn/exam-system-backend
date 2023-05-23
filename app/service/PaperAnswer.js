'use strict'

const service = require('egg').Service

class PaperAnswer extends service {

  // 添加答题记录
  async createPaperAnswer(data) {
    console.log(data)
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

  // 获取试卷每题得分率
  async getPaperScoreRate(paperId) {
    const { ctx } = this
    const result = await ctx.model.query(
      'select question_id     questionId,\n' +
      '       count(*)        total,\n' +
      '       round(avg(is_correct),2) accuracy\n' +
      'from paper_answers\n' +
      'where paper_id = :paperId\n' +
      'group by question_id',
      {
        replacements: {
          paperId
        },
        type: ctx.model.QueryTypes.SELECT
      }
    )
    return result
  }

}

module.exports = PaperAnswer
