package org.example.chickenstock.model.repository;

import io.github.cdimascio.dotenv.Dotenv;
import org.example.chickenstock.model.dto.Account;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class AccountRepository implements JDBCRepository {
    final Dotenv dotenv = Dotenv.configure().ignoreIfMissing().load();
    final String URL = dotenv.get("DB_URL");
    final String USER = dotenv.get("DB_USER");
    final String PASSWORD = dotenv.get("DB_PASSWORD");

    public List<Account> findAll() throws Exception {
        List<Account> accounts = new ArrayList<>();
        try (Connection conn = getConnection(URL, USER, PASSWORD)) {
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM accounts";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                accounts.add(new Account(rs.getLong("account_id"), rs.getString("nickname")));
            }
        }
        return accounts;
    }
}
