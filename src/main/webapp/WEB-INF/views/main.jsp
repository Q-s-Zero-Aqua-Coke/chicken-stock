<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 정보 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin: auto;
        }
        h3 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background: #f9f9f9;
        }

        /* 계좌 등록 & 삭제 영역 */
        .form-container {
            margin-top: 20px;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            border-left: 5px solid #007bff;
        }
        .delete-form {
            border-left: 5px solid #dc3545;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            text-align: left;
        }
        .input-group {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
        }
        input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            transition: 0.3s;
        }
        button:hover {
            background: #0056b3;
        }
        .delete-btn {
            background: #dc3545;
        }
        .delete-btn:hover {
            background: #c82333;
        }

        /* 반응형 */
        @media screen and (max-width: 600px) {
            .input-group {
                flex-direction: column;
                gap: 5px;
            }
            input, button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h3>📋 회원 목록</h3>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>닉네임</th>
        </tr>
        </thead>
        <tbody>
        <%
            java.util.List accounts = (java.util.List) request.getAttribute("accounts");
            if (accounts != null && !accounts.isEmpty()) {
                for (Object obj : accounts) {
                    String accountStr = obj.toString();
                    int idStart = accountStr.indexOf("id=") + 3;
                    int idEnd = accountStr.indexOf(",", idStart);
                    int nicknameStart = accountStr.indexOf("nickname=") + 9;
                    int nicknameEnd = accountStr.indexOf("]", nicknameStart);

                    String id = accountStr.substring(idStart, idEnd);
                    String nickname = accountStr.substring(nicknameStart, nicknameEnd);
        %>
        <tr>
            <td data-label="ID"><%= id %></td>
            <td data-label="닉네임"><%= nickname %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="2">등록된 회원이 없습니다.</td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div class="form-container">
        <h3>📝 회원 등록</h3>
        <form method="post">
            <input type="text" hidden="hidden" name="id" value="0">
            <div class="input-group">
                <input type="text" name="nickname" placeholder="닉네임을 입력하세요" required>
                <button type="submit">등록</button>
            </div>
        </form>
    </div>

    <div class="form-container delete-form">
        <h3>🗑️ 회원 삭제</h3>
        <form action="delete">
            <div class="input-group">
                <input type="number" name="id" placeholder="삭제할 ID 입력" required>
                <button class="delete-btn">삭제</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
