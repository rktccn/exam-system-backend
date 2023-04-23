'use strict'

module.exports = (app) => {
  const { STRING, BOOLEAN, INTEGER, DATE } = app.Sequelize
  const QuestionOption = app.model.define('question_option', {
    teacherId: {
      type: INTEGER,
      allowNull: false,
      comment: '教师编号',
      references: {
        model: app.model.Role,
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
    // 选项内容
    content: {
      type: STRING(1000),
      allowNull: false,
      comment: '选项内容'
    },
    // 是否正确
    isCorrect: {
      type: BOOLEAN,
      allowNull: false,
      comment: '是否正确'
    },
    // 分值
    score: {
      type: INTEGER,
      allowNull: false,
      comment: '分值'
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

  return QuestionOption
}
