/* eslint valid-jsdoc: "off" */

'use strict'

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {{sequelize: {database: string, dialect: string, port: number, host: string}}}
   **/
  const config = exports = {
    sequelize: {
      dialect: 'mysql',
      host: 'localhost',
      port: 3306,
      database: 'exam_system',
      username: 'root',
      password: '2500123'
    }
  }

  config.security = {
    csrf: {
      enable: false
    }
  }

  config.cors = {
    origin: '*',
    allowMethods: 'GET,HEAD,PUT,POST,DELETE,PATCH,OPTIONS'
  }
  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1682062242059_6723'

  // add your middleware config here
  config.middleware = []

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  }


  return {
    ...config,
    ...userConfig
  }
}
