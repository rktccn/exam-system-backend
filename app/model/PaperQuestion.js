'use strict'

module.exports = (app) => {
  const { INTEGER, DATE } = app.Sequelize
  const PaperQuestion = app.model.define('paper_question', {
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
    createdAt: {
      field: 'created_at',
      type: DATE
    },
    updatedAt: {
      field: 'updated_at',
      type: DATE
    }
  })

  return PaperQuestion
}
