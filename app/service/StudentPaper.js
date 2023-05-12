'use strict'

const Controller = require('egg').Controller

class StudentPaperController extends Controller {
  // 创建学生试卷关联
  async createStudentPaper(data) {
    const { ctx } = this
    const result = await ctx.model.StudentPaper.create(data)
    return result.toJSON().id
  }

  // 获取学生试卷关联(试卷ID)
  async getStudentList(paperId) {
    const { ctx } = this
    const result = await ctx.model.StudentPaper.findAll({
      where: {
        paperId
      }
    })
    return result.map(item => item.toJSON())
  }


  // 获取学生试卷关联(学生ID)
  async getPaperList(studentId) {
    const { ctx } = this
    const result = await ctx.model.StudentPaper.findAll({
      where: {
        studentId
      }
    })
    return result.map(item => item.toJSON())
  }
}

module.exports = StudentPaperController
