const log4js = require('log4js');
const config = require('config');
const lob = require("./lob.json");
const logger = log4js.getLogger('service - lob');
logger.level = config.logLevel;

const lineOfBusinessService = {};
lineOfBusinessService.listLineOfBusiness = () => {
    return lob;
}

module.exports = lineOfBusinessService;