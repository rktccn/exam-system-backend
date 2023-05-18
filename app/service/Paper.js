'use strict'

const service = require('egg').Service

const Op = require('sequelize').Op

class Paper extends service {

  // 创建试卷
  async createPaper(data) {
    const { ctx } = this
    const result = await ctx.model.Paper.create(data)
    return result.toJSON().paperId
  }

  // 获取所有试卷
  async getPaperList(limit, offset, type) {
    // 判断类型，type为1时获取活跃的试卷，为0时获取过时的试卷，没有type时获取所有试卷
    const { ctx } = this
    let result
    if (type === 1) {
      result = await ctx.model.Paper.findAndCountAll({
        where: {
          endTime: {
            [Op.gt]: new Date()
          }
        },
        limit,
        offset
      })
    } else if (type === 0) {
      result = await ctx.model.Paper.findAndCountAll({
        where: {
          endTime: {
            [Op.lt]: new Date()
          }
        },
        limit,
        offset
      })
    } else {
      result = await ctx.model.Paper.findAndCountAll({
        limit,
        offset
      })
    }
    return result
  }

  // 获取试卷详情
  async getPaperDetail(paperId) {
    const { ctx } = this
    const result = await ctx.model.Paper.findOne({
      where: {
        paperId
      }
    })
    return result.toJSON()
  }


}

module.exports = Paper
