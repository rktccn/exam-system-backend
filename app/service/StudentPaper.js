'use strict'

const Controller = require('egg').Controller
const Op = require('sequelize').Op

class StudentPaperController extends Controller {
  // 创建学生试卷关联
  async createStudentPaper(data) {
    const { ctx } = this
    const result = await ctx.model.StudentPaper.create(data)
    return result.toJSON().studentPaperId
  }

  // 更新学生试卷关联
  async updateStudentPaper(data) {
    const { ctx } = this
    const { studentPaperId, ...rest } = data
    const result = await ctx.model.StudentPaper.update(rest, {
      where: {
        studentPaperId
      }
    })
    return result
  }

  // 获取学生试卷关联(试卷ID)
  async getStudentList(paperId) {
    const { ctx } = this
    const result = await ctx.model.StudentPaper.findAndCountAll({
      where: {
        paperId
      }
    })
    return result
  }

  // 获取学生试卷关联(学生ID)
  async getPaperList(studentId, limit, offset, type) {
    const { ctx } = this
    // 判断类型，type为1时获取活跃的试卷，为0时获取过时的试卷，没有type时获取所有试卷
    let count, rows
    if (type === 1) {
      count = await ctx.model.query(
        'select count(*) count\n' +
          'from student_papers s,\n' +
          '     papers p\n' +
          'where s.student_id = :studentId\n' +
          '  and s.paper_id = p.paper_id\n' +
          '  and p.end_time >= :date_now\n',
        {
          replacements: { date_now: new Date(), studentId },
          type: ctx.model.QueryTypes.SELECT
        }
      )
      rows = await ctx.model.query(
        'select s.student_paper_id studentPaperId,\n' +
          '       student_id studentId,\n' +
          '       s.paper_id paperId,\n' +
          '       score,\n' +
          '       paper_name paperName,\n' +
          '       total_score totalScore,\n' +
          '       start_time startTime,\n' +
          '       end_time endTime\n' +
          'from student_papers s,\n' +
          '     papers p\n' +
          'where s.student_id = :studentId\n' +
          '  and s.paper_id = p.paper_id\n' +
          '  and p.end_time >= :date_now\n' +
          'limit :limit offset :offset\n',
        {
          replacements: { date_now: new Date(), studentId, limit, offset },
          type: ctx.model.QueryTypes.SELECT
        }
      )
    } else if (type === 0) {
      count = await ctx.model.query(
        'select count(*) count\n' +
          'from student_papers s,\n' +
          '     papers p\n' +
          'where s.student_id = :studentId\n' +
          '  and s.paper_id = p.paper_id\n' +
          '  and p.end_time < :date_now\n',
        {
          replacements: { date_now: new Date(), studentId },
          type: ctx.model.QueryTypes.SELECT
        }
      )
      rows = await ctx.model.query(
        'select s.student_paper_id studentPaperId,\n' +
          '       student_id studentId,\n' +
          '       s.paper_id paperId,\n' +
          '       score,\n' +
          '       paper_name paperName,\n' +
          '       total_score totalScore,\n' +
          '       start_time startTime,\n' +
          '       end_time endTime\n' +
          'from student_papers s,\n' +
          '     papers p\n' +
          'where s.student_id = :studentId\n' +
          '  and s.paper_id = p.paper_id\n' +
          '  and p.end_time < :date_now\n' +
          'limit :limit offset :offset\n',
        {
          replacements: { date_now: new Date(), studentId, limit, offset },
          type: ctx.model.QueryTypes.SELECT
        }
      )
    } else {
      count = await ctx.model.query(
        'select count(*) count\n' +
          'from student_papers s,\n' +
          '     papers p\n' +
          'where s.student_id = :studentId\n' +
          '  and s.paper_id = p.paper_id\n',
        {
          replacements: { studentId },
          type: ctx.model.QueryTypes.SELECT
        }
      )
      rows = await ctx.model.query(
        'select s.student_paper_id studentPaperId,\n' +
          '       student_id studentId,\n' +
          '       s.paper_id paperId,\n' +
          '       score,\n' +
          '       paper_name paperName,\n' +
          '       total_score totalScore,\n' +
          '       start_time startTime,\n' +
          '       end_time endTime\n' +
          'from student_papers s,\n' +
          '     papers p\n' +
          'where s.student_id = :studentId\n' +
          '  and s.paper_id = p.paper_id\n' +
          'limit :limit offset :offset\n',
        {
          replacements: { studentId, limit, offset },
          type: ctx.model.QueryTypes.SELECT
        }
      )
    }

    return { count: count[0].count, rows }
  }

  // 获取学生试卷关联(关联ID)
  async getStudentPaper(studentPaperId) {
    const { ctx } = this
    const result = await ctx.model.StudentPaper.findOne({
      where: {
        studentPaperId
      }
    })
    return result
  }

  // 获取PaperId
  async getPaperId(studentPaperId) {
    const { ctx } = this
    const result = await ctx.model.StudentPaper.findOne({
      where: {
        studentPaperId
      }
    })
    return result.toJSON().paperId
  }

  // 获取考试答题概况（平均分，最高分，最低分，试卷提交人数）
  async getExamResultInfo(paperId) {
    const { ctx } = this
    const result = await ctx.model.query(
      'select round(avg(score),2)  avgScore,\n' +
        '       max(score)  maxScore,\n' +
        '       min(score)  minScore,\n' +
        '       sum(status) submitCount,\n' +
        '       count(*)    count\n' +
        'from student_papers\n' +
        'where paper_id = :paperId',
      {
        replacements: { paperId },
        type: ctx.model.QueryTypes.SELECT
      }
    )
    return result[0]
  }

  // 获取所有学生成绩并按照分数排序
  async getExamScore(paperId) {
    const { ctx } = this
    const result = await ctx.model.query(
      'select student_paper_id               studentPaperId,\n' +
        '       student_id                     studentId,\n' +
        '       name,\n' +
        '       paper_id                       paperId,\n' +
        '       if(isnull(score), 0, score) as score\n' +
        'from student_papers\n' +
        '         left join users u on student_papers.student_id = u.user_id\n' +
        'where paper_id = :paperId\n' +
        'order by score desc',
      {
        replacements: { paperId },
        type: ctx.model.QueryTypes.SELECT
      }
    )
    return result
  }
}

module.exports = StudentPaperController
