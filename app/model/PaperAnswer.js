'use strict'

module.exports = (app) => {
  const { INTEGER, DATE } = app.Sequelize

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
    answerId: {
      type: INTEGER,
      allowNull: false,
      comment: '试题选项编号',
      references: {
        model: app.model.QuestionOption,
        key: 'id'
      }
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
