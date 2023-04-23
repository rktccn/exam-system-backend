'use strict'


module.exports = (app) => {
  const { INTEGER, DATE } = app.Sequelize

  const TeacherStudent = app.model.define('teacher_student', {
    teacherId: {
      type: INTEGER,
      allowNull: false,
      comment: '教师编号',
      references: {
        model: app.model.Role,
        key: 'id'
      }
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
    createdAt: {
      field: 'created_at',
      type: DATE
    },
    updatedAt: {
      field: 'updated_at',
      type: DATE
    }
  }, {
    comment: '教师学生关系表'
  })

  return TeacherStudent
}
