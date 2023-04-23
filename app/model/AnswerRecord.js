'use strict'

module.exports = (app) => {
  const { INTEGER, DATE } = app.Sequelize

  const AnswerRecord = app.model.define('answer_record', {
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
    questionId: {
      type: INTEGER,
      allowNull: false,
      comment: '试题编号',
      references: {
        model: app.model.Question,
        key: 'id'
      }
    },
    questionOptionId: {
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
  })

  return AnswerRecord
}
