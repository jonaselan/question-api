u1 = User.create(name: 'fulano1')
u2 = User.create(name: 'fulano2')

q1 = Question.create(body: 'sim', user: u1, private: false)
q2 = Question.create(body: 'nao', user: u2, private: true)

Answer.create(body: 'resposta a sim', user: u1, question: q2)
Answer.create(body: 'resposta a nao', user: u2, question: q1)
