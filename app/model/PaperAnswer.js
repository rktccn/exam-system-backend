'use strict'

module.exports = (app) => {
  const { INTEGER, DATE, STRING, BOOLEAN } = app.Sequelize

  const PaperAnswer = app.model.define('paper_answer', {
    paperAnswerId: {
      type: INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    studentPaperId: {
      type: INTEGER,
      allowNull: false,
      comment: '学生考试记录编号',
      references: {
        model: app.model.StudentPaper,
        key: 'id'
      }
    },
    questionId: {
      type: INTEGER,
      allowNull: false,
      comment: '试题编号',
      references: {
        model: app.model.Question,
        key: 'id'
      }
    },
    content: {
      type: STRING(1000),
      allowNull: false,
      comment: '答案'
    },
    isCorrect: {
      type: BOOLEAN,
      allowNull: false,
      comment: '是否正确'
    },
    paperId: {
      type: INTEGER,
      allowNull: false,
      comment: '试卷编号'
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

  return PaperAnswer
}
