#graphing practice

monthly_shooting_cts <- shootings %>% 
  filter(incident_year < 2020 & incident_year > 2009) %>%
  group_by(shooting_month = cut(occur_date, "month")) %>% 
  summarise(n = n()) %>%
  mutate(shooting_month = ymd(shooting_month)) 

monthly_shooting_cts %>% 
  count(shooting_month, wt = n) %>% 
  mutate(year = year(shooting_month)) %>% 
  ggplot(aes(shooting_month, n)) +
  geom_segment(aes(xend = shooting_month, yend = 0), colour = "black", 
               size = 0.25) +
  geom_point(colour = "grey50", size = 0.5) +
  #geom_smooth(method = "loess", formula = "y ~ x", se = FALSE, 
  #            colour = "darkred") +
  scale_x_date(date_breaks = "6 months", date_labels = "%b") +
  scale_y_continuous(limits = c(0, NA), 
                     expand = expansion(mult = c(0, 0.025))) +
  facet_wrap(vars(year), ncol = 10, scales = "free_x", 
             strip.position = "bottom") +
  labs(
    x = NULL,
    y = "monthly shooting incidents",
    caption = "Data: NYPD Shooting Data"
  ) +
  #theme_cjcharts() +
  plotTheme()+
  theme(
    axis.line.x = element_line(colour = "grey75"),
    panel.grid = element_blank(),
    strip.placement = "outside"
  )

ggsave('images/shooting_seasonality.png')

