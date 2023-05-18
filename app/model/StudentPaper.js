'use strict'

module.exports = (app) => {
  const { INTEGER, DATE } = app.Sequelize

  const StudentPaper = app.model.define('student_paper', {
    studentPaperId: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    studentId: {
      type: INTEGER,
      allowNull: false,
      comment: '学生编号',
      references: {
        model: app.model.Role,
        key: 'id'
      }
    },
    paperId: {
      type: INTEGER,
      allowNull: false,
      comment: '试卷编号',
      references: {
        model: app.model.Paper,
        key: 'id'
      }
    },
    // 得分
    score: {
      type: INTEGER,
      allowNull: true,
      comment: '得分'
    },

    // 答题时间
    answerTime: {
      field: 'answer_time',
      type: DATE,
      allowNull: true,
      comment: '答题时间'
    },
    // 交卷时间
    submitTime: {
      field: 'submit_time',
      type: DATE,
      allowNull: true,
      comment: '交卷时间'
    },
    // 状态
    status: {
      type: INTEGER,
      allowNull: true,
      comment: '状态, 0: 未开始, 1: 进行中, 2: 已结束'
    },
    createdAt: {
      field: 'created_at',
      type: DATE
    },
    updatedAt: {
      field: 'updated_at',
      type: DATE
    }
  }, {
    collate: 'utf8mb4_general_ci'
  })

  return StudentPaper
}
