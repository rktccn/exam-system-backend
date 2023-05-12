'use strict'

const service = require('egg').Service

class Paper extends service {
  // 创建试卷
  async createPaper(data) {
    const { ctx } = this
    const result = await ctx.model.Paper.create(data)
    return result.toJSON().id
  }

  // 获取所有试卷
  async getPaperList() {
    const { ctx } = this
    const result = await ctx.model.Paper.findAndCountAll()
    return {
      count: result.count,
      rows: result.rows.map(item => {
        return item.toJSON()
      })
    }
  }

}

module.exports = Paper
