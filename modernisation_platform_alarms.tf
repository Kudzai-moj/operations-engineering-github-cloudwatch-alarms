module "unauthorised_users_modify_repository_settings_alarm" {
  source = "./modules/alarm"

  sns_topic_arn = module.modernisation_platform_topic.sns_topic_arn

  alarm_description = "Alarm for when any user modifies the settings of ministryofjustice/modernisation-platform repository"

  metric_name = "UnathorisedUsersModifyRepositorySettingsEvents"
  metric_filter_pattern = {
    repositories           = ["ministryofjustice/modernisation-platform"]
    events                 = ["repo.access", "repo.add_member", "repo.change_merge_setting"]
  }
}