PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (

    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (

    id INTEGER PRIMARY KEY,
    liked BOOLEAN,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    users(fname, lname)
VALUES
    ('zuzu', 'chaoui'),
    ('john', 'adams'),
    ('marcus', 'aurelius'),
    ('winston', 'churchill'),
    ('brad', 'pitt');

INSERT INTO
   questions(title, body, user_id)
VALUES
    ('zuzu question', 'how do you turn this on', (SELECT id FROM users WHERE fname = 'zuzu' AND lname = 'chaoui')),
    ('politics question', 'what is freedom', (SELECT id FROM users WHERE fname = 'john' AND lname = 'adams')),
    ('philosophy question', 'what is life', (SELECT id FROM users WHERE fname = 'marcus' AND lname = 'aurelius')),
    ('war question', 'what is world war 2', (SELECT id FROM users WHERE fname = 'winston' AND lname = 'churchill')),
    ('brad question', 'what color is my hair', (SELECT id FROM users WHERE fname = 'brad' AND lname = 'pitt')) ;
    
INSERT INTO
    replies (body, question_id, parent_reply_id, user_id)
VALUES
    ("your question sucks", 
    (SELECT id FROM questions WHERE title = 'politics question'), 
    NULL,
    (SELECT id FROM users WHERE fname = 'zuzu' AND lname = 'chaoui')
    ),
    ("life is tough", 
    (SELECT id FROM questions WHERE title = 'philosophy question'), 
    NULL,
    (SELECT id FROM users WHERE fname = 'brad' AND lname = 'pitt')
    );

INSERT INTO
    question_follows (question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE user_id = 1),
    (SELECT id FROM users WHERE fname = 'zuzu')
    ),
    ((SELECT id FROM questions WHERE user_id = 1),
    (SELECT id FROM users WHERE fname = 'marcus')
    ),
    ((SELECT id FROM questions WHERE user_id = 1),
    (SELECT id FROM users WHERE fname = 'john')
    );
    
INSERT INTO
   question_likes(liked, user_id, question_id)
VALUES
   (TRUE, 
   (SELECT id FROM users WHERE fname = 'zuzu' AND lname = 'chaoui'), 
   (SELECT id FROM questions WHERE title = 'zuzu question'));
   



