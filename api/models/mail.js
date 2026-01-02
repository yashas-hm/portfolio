/**
 * @typedef {Object} MailRequest
 * @property {string} [name] - Sender's name (optional)
 * @property {string} email - Sender's email (required)
 * @property {string} message - Message content (required)
 */

/**
 * @typedef {Object} MailResponse
 * @property {boolean} success - Whether the operation succeeded
 * @property {string} message - Response message
 */

/**
 * Creates a success response
 * @param {string} message
 * @returns {MailResponse}
 */
function successResponse(message) {
  return { success: true, message };
}

/**
 * Creates an error response
 * @param {string} message
 * @returns {MailResponse}
 */
function errorResponse(message) {
  return { success: false, message };
}

module.exports = { successResponse, errorResponse };