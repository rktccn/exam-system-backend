'use strict'

module.exports = (app) => {
  const { STRING, BIGINT, INTEGER, DATE } = app.Sequelize
  const Paper = app.model.define('paper', {
    teacherId: {
      type: INTEGER,
      allowNull: false,
      comment: '教师编号',
      references: {
        model: app.model.Role,
        key: 'id'
      }
    },
    // 试卷名称
    paperName: {
      type: STRING(30),
      allowNull: false,
      comment: '试卷名称'
    },
    // 试卷总分
    totalScore: {
      type: INTEGER,
      allowNull: false,
      comment: '试卷总分'
    },
    // 试卷时长
    duration: {
      type: INTEGER,
      allowNull: false,
      comment: '试卷时长'
    },
    // 试卷开始时间
    startTime: {
      field: 'start_time',
      type: DATE,
      allowNull: false,
      comment: '试卷开始时间'
    },
    // 试卷结束时间
    endTime: {
      field: 'end_time',
      type: DATE,
      allowNull: false,
      comment: '试卷结束时间'
    },
    // 试卷状态
    status: {
      type: INTEGER,
      allowNull: false,
      comment: '试卷状态, 0: 未开始, 1: 进行中, 2: 已结束'
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

  return Paper
}
