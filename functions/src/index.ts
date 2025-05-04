import {setGlobalOptions} from "firebase-functions";
import {initializeApp} from "firebase-admin/app";

initializeApp();
setGlobalOptions({region: 'asia-northeast3'});


/** USER */
export { createUserProfile } from './user/createUserProfile';
export { getUserProfile } from './user/getUserProfile';
export { updateUserProfile } from './user/updateUserProfile';
export { updateFcmToken } from './user/updateFcmToken';
export { getPointHistory } from './user/getPointHistory';

/** QUESTION */
export { createQuestion } from './question/createQuestion';
export { getMyQuestions } from './question/getMyQuestions';
export { getQuestionDetail } from './question/getQuestionDetail';
export { getDailyQuestions } from './question/getDailyQuestions';
export { submitAnswer } from './question/submitAnswer';
export { checkAlreadySolved } from './question/checkAlreadySolved';
export { likeQuestion } from './question/likeQuestion';

/** FOLLOW */
export { isFollowing } from './follow/isFollowing';
export { getFollowers } from './follow/getFollowers';
export { getFollowing } from './follow/getFollowing';
export { toggleFollow } from './follow/toggleFollow';

/** RANKING */
export { getRankingList } from './ranking/getRankingList';
export { getFollowingRanking } from './ranking/getFollowingRanking';
export { getRecentLevelUps } from './ranking/getRecentLevelUps';

/** NOTIFICATION */
export { getNotifications } from './notification/getNotifications';

/** FEED */
export { getFollowingFeed } from './feed/getFollowingFeed';
export { getFeeds } from './feed/getFeeds';
export { createFeed } from './feed/createFeed';
export { addFeedComment } from './feed/addFeedComment';
export { sendFeedReaction } from './feed/sendFeedReaction';
export { likeFeedComment } from './feed/likeFeedComment';
export { reportFeedComment } from './feed/reportFeedComment';

