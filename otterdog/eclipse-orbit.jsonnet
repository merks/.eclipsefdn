local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-orbit') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/tools.orbit",
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Provides infrastructure for redistributing third-party libraries as OSGi bundles via p2 repositories.",
    email: "orbit-dev@eclipse.org",
    name: "Eclipse Orbit",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
  },
  _repositories+:: [
    orgs.newRepo('.github') {
      description: "Global configurations for the eclipse-orbit GitHub organization",
    },
    orgs.newRepo('ebr') {
      allow_auto_merge: true,
      allow_merge_commit: false,
      allow_update_branch: false,
      description: "Eclipse Bundle Recipe infrastructure.",
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('orbit') {
      allow_merge_commit: false,
      allow_update_branch: false,
      description: "Third-party libraries bundled using Eclipse Bundle Recipes.",
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
  ],
}
