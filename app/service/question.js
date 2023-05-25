'use strict'

const service = require('egg').Service
const Op = require('sequelize').Op

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
    return result.toJSON().questionId
  }

  // 获取题目
  async getQuestion(questionId) {
    const { ctx } = this
    const result = await ctx.model.Question.findOne({
      where: {
        questionId
      }
    })
    return result.toJSON()
  }

  // 获取题目列表
  async getQuestionList(limit, offset, key) {
    const { ctx } = this
    let res
    if (key) {
      res = await ctx.model.Question.findAndCountAll({
        where: {
          content: {
            [Op.like]: `%${key}%`
          }
        },
        limit,
        offset
      })
    } else {
      res = await ctx.model.Question.findAndCountAll({
        limit,
        offset
      })
    }

    return {
      count: res.count,
      rows: res.rows.map(item => item.toJSON())
    }
  }

  // 修改题目
  async updateQuestion(questionId, content, score, type) {
    const { ctx } = this
    const result = await ctx.model.Question.update(
      {
        content,
        score,
        type
      },
      {
        where: {
          questionId
        }
      }
    )
    return result
  }

  // 搜索题目
  async searchQuestion(key, limit, offset) {
    const { ctx } = this
    const result = await ctx.model.Question.findAll({
      where: {
        content: {
          [ctx.model.Op.like]: `%${key}%`
        }
      },
      limit,
      offset
    })
    return result.map(item => item.toJSON())
  }
}

module.exports = Question
