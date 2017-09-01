import mirrorCreator from 'mirror-creator';

export const formNames = mirrorCreator([
  'SUBMISSION',
]);

export const questionTypes = mirrorCreator([
  'MultipleChoice',
  'MultipleResponse',
  'Programming',
  'TextResponse',
  'FileUpload',
]);

export const workflowStates = {
  Unstarted: 'unstarted',
  Attempting: 'attempting',
  Submitted: 'submitted',
  Graded: 'graded',
  Published: 'published',
};

export const TestCaseTypes = {
  Public: 'public_test',
  Private: 'private_test',
  Evaluation: 'evaluation_test',
};

const actionTypes = mirrorCreator([
  'FETCH_SUBMISSION_REQUEST', 'FETCH_SUBMISSION_SUCCESS', 'FETCH_SUBMISSION_FAILURE',
  'AUTOGRADE_SUBMISSION_REQUEST', 'AUTOGRADE_SUBMISSION_SUCCESS', 'AUTOGRADE_SUBMISSION_FAILURE',
  'SAVE_DRAFT_REQUEST', 'SAVE_DRAFT_SUCCESS', 'SAVE_DRAFT_FAILURE',
  'FINALISE_REQUEST', 'FINALISE_SUCCESS', 'FINALISE_FAILURE',
  'UNSUBMIT_REQUEST', 'UNSUBMIT_SUCCESS', 'UNSUBMIT_FAILURE',
  'AUTOGRADE_REQUEST', 'AUTOGRADE_SUCCESS', 'AUTOGRADE_FAILURE',
  'RESET_REQUEST', 'RESET_SUCCESS', 'RESET_FAILURE',
  'SAVE_GRADE_REQUEST', 'SAVE_GRADE_SUCCESS', 'SAVE_GRADE_FAILURE',
  'MARK_REQUEST', 'MARK_SUCCESS', 'MARK_FAILURE',
  'UNMARK_REQUEST', 'UNMARK_SUCCESS', 'UNMARK_FAILURE',
  'PUBLISH_REQUEST', 'PUBLISH_SUCCESS', 'PUBLISH_FAILURE',
  'CREATE_COMMENT_REQUEST', 'CREATE_COMMENT_SUCCESS', 'CREATE_COMMENT_FAILURE', 'CREATE_COMMENT_CHANGE',
  'UPDATE_COMMENT_REQUEST', 'UPDATE_COMMENT_SUCCESS', 'UPDATE_COMMENT_FAILURE', 'UPDATE_COMMENT_CHANGE',
  'DELETE_COMMENT_REQUEST', 'DELETE_COMMENT_SUCCESS', 'DELETE_COMMENT_FAILURE',
  'CREATE_ANNOTATION_REQUEST', 'CREATE_ANNOTATION_SUCCESS', 'CREATE_ANNOTATION_FAILURE', 'CREATE_ANNOTATION_CHANGE',
  'UPDATE_ANNOTATION_REQUEST', 'UPDATE_ANNOTATION_SUCCESS', 'UPDATE_ANNOTATION_FAILURE', 'UPDATE_ANNOTATION_CHANGE',
  'DELETE_ANNOTATION_REQUEST', 'DELETE_ANNOTATION_SUCCESS', 'DELETE_ANNOTATION_FAILURE',
  'DELETE_ATTACHMENT_REQUEST', 'DELETE_ATTACHMENT_SUCCESS', 'DELETE_ATTACHMENT_FAILURE',
  'UPDATE_GRADING', 'UPDATE_EXP', 'UPDATE_MULTIPLIER',

  'FETCH_SUBMISSIONS_REQUEST', 'FETCH_SUBMISSIONS_SUCCESS', 'FETCH_SUBMISSIONS_FAILURE',
  'PUBLISH_SUBMISSIONS_REQUEST', 'PUBLISH_SUBMISSIONS_SUCCESS', 'PUBLISH_SUBMISSIONS_FAILURE',
  'DOWNLOAD_SUBMISSIONS_REQUEST', 'DOWNLOAD_SUBMISSIONS_SUCCESS', 'DOWNLOAD_SUBMISSIONS_FAILURE',

  'SET_NOTIFICATION',
]);

export default actionTypes;
