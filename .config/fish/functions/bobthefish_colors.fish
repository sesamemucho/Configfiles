function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'

  # Optionally include a base color scheme
  __bobthefish_colors default

  # Then override everything you want!
  # Note that these must be defined with `set -x`
  set -x color_initial_segment_exit     a9b7c6 bc3f3c --bold
  set -x color_initial_segment_su       a9b7c6 5e8759 --bold
  set -x color_initial_segment_jobs     a9b7c6 cc7832 --bold

  set -x color_path                     black a9b7c6
  set -x color_path_basename            black a9b7c6 --bold
  set -x color_path_nowrite             magenta black
  set -x color_path_nowrite_basename    magenta black --bold

  set -x color_repo                     5e8759 black
  set -x color_repo_work_tree           black black --bold
  set -x color_repo_dirty               bc3f3c black
  set -x color_repo_staged              cc7832 black

  set -x color_vi_mode_default          cc7832 black --bold
  set -x color_vi_mode_insert           5e8759 black --bold
  set -x color_vi_mode_visual           cc7832 black --bold

  set -x color_vagrant                  cc7832 black
  set -x color_k8s                      magenta a9b7c6 --bold
  set -x color_username                 a9b7c6 black --bold
  set -x color_hostname                 a9b7c6 black
  set -x color_rvm                      brmagenta black --bold
  set -x color_virtualfish              cc7832 black --bold
  set -x color_virtualgo                cc7832 black --bold
  set -x color_desk                     cc7832 black --bold
end
