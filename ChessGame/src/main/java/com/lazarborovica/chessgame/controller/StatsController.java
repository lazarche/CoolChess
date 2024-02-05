package com.lazarborovica.chessgame.controller;

import com.lazarborovica.chessgame.dto.*;
import com.lazarborovica.chessgame.entity.Player;
import com.lazarborovica.chessgame.repository.ChessMatchRepository;
import com.lazarborovica.chessgame.repository.PlayerRepository;
import com.lazarborovica.chessgame.service.StatsService;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/stats")
public class StatsController {

    @Autowired
    PlayerRepository playerRepository;

    @Autowired
    StatsService statsService;

    @GetMapping("/userStats")
    public String userStats(String searchedUsername, Integer matchId, Model model) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        if(searchedUsername != null)
            username = searchedUsername;

        Player player = playerRepository.findByUsername(username);
        model.addAttribute("matches", statsService.getMatchHistory(player));
        model.addAttribute("statsData", statsService.getStats(player));

        return "stats";
    }

    @GetMapping("/reportMatchHistory")
    public void reportMatchHistory(HttpServletResponse response) throws JRException, IOException {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Player player = playerRepository.findByUsername(username);

        List<ReportChessMatchDTO> list = statsService.getMatchHistoryReport(player);

        response.setContentType("text/html");
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(list);
        InputStream inputStream = this.getClass().getResourceAsStream("/static/jasperreports/MatchHistoryReport.jrxml");
        JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);

        Map<String, Object> params = new HashMap<>();
        StatsDTO stats = statsService.getStats(player);
        params.put("total", stats.getTotal());
        params.put("wins", stats.getWins());
        params.put("loses", stats.getLoses());
        params.put("ratio", stats.getRatio());
        params.put("playerUsername", player.getUsername());

        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
        inputStream.close();

        response.setContentType("application/x-download");
        response.addHeader("Content-disposition", "attachment; filename=MatchHistoryReport.pdf");
        OutputStream out = response.getOutputStream();
        JasperExportManager.exportReportToPdfStream(jasperPrint,out);
    }

    @GetMapping("/reportMatch")
    public void reportMatch(Integer idMatch, HttpServletResponse response) throws JRException, IOException {
        List<ReportMoveDTO> list = statsService.getChessmoves(idMatch);
        System.out.println(list.size());

        response.setContentType("text/html");
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(list);
        InputStream inputStream = this.getClass().getResourceAsStream("/static/jasperreports/MatchReport.jrxml");
        JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);

        Map<String, Object> params = new HashMap<>();
        MatchStatsDTO stats = statsService.getMatchStats(idMatch);
        params.put("whiteUsername", stats.getWhiteUsername());
        params.put("whiteStatus", stats.getWhiteStatus());
        params.put("blackUsername", stats.getBlackUsername());
        params.put("blackStatus", stats.getBlackStatus());

        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
        inputStream.close();

        response.setContentType("application/x-download");
        response.addHeader("Content-disposition", "attachment; filename=MatchReport.pdf");
        OutputStream out = response.getOutputStream();
        JasperExportManager.exportReportToPdfStream(jasperPrint,out);
    }

}
