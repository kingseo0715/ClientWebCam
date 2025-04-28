from graphviz import Digraph

# ERD 생성
erd = Digraph('ERD', format='png')

# 테이블 노드 추가
erd.node('Company', 'Company\n- CompanyID (PK)\n- Name\n- Location\n- Industry\n- CreatedAt', shape='box')
erd.node('JobPosting', 'JobPosting\n- JobID (PK)\n- CompanyID (FK)\n- Title\n- Description\n- Salary\n- PostedAt\n- Deadline', shape='box')
erd.node('User', 'User\n- UserID (PK)\n- Name\n- Email\n- PasswordHash\n- CreatedAt', shape='box')
erd.node('User_Viewed_Job', 'User_Viewed_Job\n- UserID (FK, PK)\n- JobID (FK, PK)\n- ViewedAt', shape='box')
erd.node('User_Viewed_Company', 'User_Viewed_Company\n- UserID (FK, PK)\n- CompanyID (FK, PK)\n- ViewedAt', shape='box')

# 관계 설정 (외래키 연결)
erd.edge('Company', 'JobPosting', label='1:N (Has)')
erd.edge('User', 'User_Viewed_Job', label='1:N (Views)')
erd.edge('User', 'User_Viewed_Company', label='1:N (Views)')
erd.edge('JobPosting', 'User_Viewed_Job', label='1:N (Is Viewed)')
erd.edge('Company', 'User_Viewed_Company', label='1:N (Is Viewed)')

# ERD 출력
erd_path = "C:/Users/lms5/Desktop/ERD.png"
erd.render(erd_path, format="png", cleanup=True)
erd_path
