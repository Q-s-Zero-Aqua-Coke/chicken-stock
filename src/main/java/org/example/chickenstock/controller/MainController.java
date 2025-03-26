package org.example.chickenstock.controller;

import org.example.chickenstock.model.dto.Account;
import org.example.chickenstock.model.repository.AccountRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
public class MainController {
    final AccountRepository accountRepository;

    public MainController(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    @GetMapping
    public String root(Model model) throws Exception {
        List<Account> accounts = accountRepository.findAll();
        model.addAttribute("accounts", accounts);
        return "main";
    }
}